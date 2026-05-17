load test_helper

@test "Ignore page breaks in single-line comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files withe the IGNORE content type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_ignored_files.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report valid page break variations" {
  run run_vale "$BATS_TEST_FILENAME" report_page_break.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" = "report_page_break.adoc:5:1:AsciiDocDITA.PageBreak:Page breaks are not supported in DITA." ]
  [ "${lines[1]}" = "report_page_break.adoc:9:1:AsciiDocDITA.PageBreak:Page breaks are not supported in DITA." ]
  [ "${lines[2]}" = "report_page_break.adoc:14:1:AsciiDocDITA.PageBreak:Page breaks are not supported in DITA." ]
}
