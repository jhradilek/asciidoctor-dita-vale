load test_helper

@test "Ignore files withe the IGNORE content type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_ignored_files.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report block STEM content" {
  run run_vale "$BATS_TEST_FILENAME" report_block_stem.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 6 ]
  [ "${lines[0]}" = "report_block_stem.adoc:2:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[1]}" = "report_block_stem.adoc:4:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[2]}" = "report_block_stem.adoc:9:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[3]}" = "report_block_stem.adoc:15:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[4]}" = "report_block_stem.adoc:17:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[5]}" = "report_block_stem.adoc:22:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
}

@test "Report inline STEM content" {
  run run_vale "$BATS_TEST_FILENAME" report_inline_stem.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 6 ]
  [ "${lines[0]}" = "report_inline_stem.adoc:2:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[1]}" = "report_inline_stem.adoc:4:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[2]}" = "report_inline_stem.adoc:6:21:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[3]}" = "report_inline_stem.adoc:9:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[4]}" = "report_inline_stem.adoc:11:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[5]}" = "report_inline_stem.adoc:13:21:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
}
