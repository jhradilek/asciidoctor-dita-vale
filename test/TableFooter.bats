load test_helper

@test "Ignore table footers in single-line comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files withe the IGNORE content type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_ignored_files.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report valid table footer variations" {
  run run_vale "$BATS_TEST_FILENAME" report_table_footers.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 4 ]
  [ "${lines[0]}" = "report_table_footers.adoc:2:1:AsciiDocDITA.TableFooter:Table footers are not supported in DITA." ]
  [ "${lines[1]}" = "report_table_footers.adoc:14:1:AsciiDocDITA.TableFooter:Table footers are not supported in DITA." ]
  [ "${lines[2]}" = "report_table_footers.adoc:26:1:AsciiDocDITA.TableFooter:Table footers are not supported in DITA." ]
  [ "${lines[3]}" = "report_table_footers.adoc:39:1:AsciiDocDITA.TableFooter:Table footers are not supported in DITA." ]
}
