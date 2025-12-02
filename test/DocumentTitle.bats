load test_helper

@test "Ignore files with valid document titles" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_title.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files with titles in single-line conditions" {
  run run_vale "$BATS_TEST_FILENAME" ignore_conditional_title.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore missing document titles in snippet files" {
  run run_vale "$BATS_TEST_FILENAME" ignore_snippets.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report document titles that only appear in code blocks" {
  run run_vale "$BATS_TEST_FILENAME" report_code_blocks.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_code_blocks.adoc:1:1:AsciiDocDITA.DocumentTitle:The document title (a level 0 heading) is missing." ]
}

@test "Report document titles that only appear in comments" {
  run run_vale "$BATS_TEST_FILENAME" report_comments.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_comments.adoc:1:1:AsciiDocDITA.DocumentTitle:The document title (a level 0 heading) is missing." ]
}

@test "Report missing document titles" {
  run run_vale "$BATS_TEST_FILENAME" report_missing_title.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_missing_title.adoc:1:1:AsciiDocDITA.DocumentTitle:The document title (a level 0 heading) is missing." ]
}
