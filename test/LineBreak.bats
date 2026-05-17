load test_helper

@test "Ignore hard line breaks in single-line comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files withe the IGNORE content type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_ignored_files.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report valid hard line break variations" {
  run run_vale "$BATS_TEST_FILENAME" report_line_break.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 7 ]
  [ "${lines[0]}" = "report_line_break.adoc:2:1:AsciiDocDITA.LineBreak:Hard line breaks are not supported in DITA." ]
  [ "${lines[1]}" = "report_line_break.adoc:6:1:AsciiDocDITA.LineBreak:Hard line breaks are not supported in DITA." ]
  [ "${lines[2]}" = "report_line_break.adoc:10:1:AsciiDocDITA.LineBreak:Hard line breaks are not supported in DITA." ]
  [ "${lines[3]}" = "report_line_break.adoc:16:1:AsciiDocDITA.LineBreak:Hard line breaks are not supported in DITA." ]
  [ "${lines[4]}" = "report_line_break.adoc:21:1:AsciiDocDITA.LineBreak:Hard line breaks are not supported in DITA." ]
  [ "${lines[5]}" = "report_line_break.adoc:26:1:AsciiDocDITA.LineBreak:Hard line breaks are not supported in DITA." ]
  [ "${lines[6]}" = "report_line_break.adoc:31:1:AsciiDocDITA.LineBreak:Hard line breaks are not supported in DITA." ]
}
