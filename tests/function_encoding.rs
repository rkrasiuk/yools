use std::io::Write;
use std::process::Command;
use tempfile::NamedTempFile;
use yools::encoder::FunctionVariables;
use yools::encoder::encode_function;
use yultsur::dialect::EVMDialect;
use yultsur::resolver::resolve;
use yultsur::yul::*;
use yultsur::yul_parser;

fn encode_first_function(input: &str) -> (String, FunctionVariables) {
    let mut ast = yul_parser::parse_block(&std::format!("{{ {} }}", input));
    let signatures = resolve::<EVMDialect>(&mut ast);
    if let Some(Statement::FunctionDefinition(function)) = ast.statements.iter().next() {
        encode_function(function, signatures)
    } else {
        panic!("Could not find function.")
    }
}

fn query_smt(query: &String) -> bool {
    let query = format!("{}\n{}", query, "(check-sat)");

    let mut file = NamedTempFile::new().unwrap();
    file.write(query.as_bytes()).unwrap();

    let output = Command::new("cvc4")
        .args(["--lang", "smt2"])
        .args([file.path()])
        .output()
        .expect("failed to run query");

    match String::from_utf8(output.stdout).unwrap().as_str() {
        "sat\n" => true,
        "unsat\n" => false,
        _ => panic!("Invalid output from smt solver. Query: {}", &query),
    }
}

fn tautology(q: &str, condition: &String) {
    let query = &std::format!("{q}\n(assert (not {condition}))\n");
    assert!(!query_smt(&query), "Tautology failed. Query: {query}");
}
fn satisfiable(q: &str, condition: &String) {
    let query = &std::format!("{q}\n(assert {condition})\n");
    assert!(query_smt(&query), "Satisfiability failed. Query: {query}");
}

#[test]
fn projection() {
    let (encoding, variables) = encode_first_function("function f(x, y) -> r { r := y }");
    tautology(
        &encoding,
        &std::format!("(= {} {})", variables.returns[0].name, variables.parameters[1].name),
    );
    satisfiable(
        &encoding,
        &std::format!("(= {} {})", variables.returns[0].name, variables.parameters[0].name),
    );
}

#[test]
fn zero_init() {
    let (encoding, variables) = encode_first_function("function f(x, y) -> r, t { r := y }");
    tautology(
        &encoding,
        &std::format!("(= {} #x{:064X})", variables.returns[1].name, 0),
    );
}

#[test]
fn arith_add() {
    let (encoding, variables) = encode_first_function("function f(x, y) -> r { r := add(x, y) }");
    tautology(
        &encoding,
        &std::format!(
            "(= {} (bvadd {} {}))",
            variables.returns[0].name,
            variables.parameters[0].name,
            variables.parameters[1].name
        ),
    );
}

#[test]
fn branches() {
    let (encoding, variables) = encode_first_function(
        r#"
        function f(x, y) -> r {
            let t := 20
            if lt(x, 2) { t := 7 }
            if gt(x, 1) { t := 8 }
            r := lt(t, 9)
        }"#,
    );
    tautology(
        &encoding,
        &std::format!("(= {} #x{:064X})", variables.returns[0].name, 1),
    );
}