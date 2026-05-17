load test_helper

@test "Ignore discrete headings in single-line comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files withe the IGNORE content type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_ignored_files.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report valid discrete heading variations" {
  run run_vale "$BATS_TEST_FILENAME" report_discrete_heading.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_discrete_heading.adoc:2:1:AsciiDocDITA.DiscreteHeading:Discrete headings are not supported in DITA." ]
  [ "${lines[1]}" = "report_discrete_heading.adoc:8:1:AsciiDocDITA.DiscreteHeading:Discrete headings are not supported in DITA." ]
}
