load test_helper

@test "Ignore files with valid IDs" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_ids.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report files with mismatched quotes in IDs" {
  run run_vale "$BATS_TEST_FILENAME" report_mismatched_quotes.adoc
  [ "$status" -ne 0 ]
  [ "${#lines[@]}" -eq 6 ]
  [ "${lines[0]}" = "report_mismatched_quotes.adoc:3:1:AsciiDocDITA.MismatchedId:The quotes in the ID are mismatched." ]
  [ "${lines[1]}" = "report_mismatched_quotes.adoc:6:1:AsciiDocDITA.MismatchedId:The quotes in the ID are mismatched." ]
  [ "${lines[2]}" = "report_mismatched_quotes.adoc:9:1:AsciiDocDITA.MismatchedId:The quotes in the ID are mismatched." ]
  [ "${lines[3]}" = "report_mismatched_quotes.adoc:12:1:AsciiDocDITA.MismatchedId:The quotes in the ID are mismatched." ]
  [ "${lines[4]}" = "report_mismatched_quotes.adoc:15:1:AsciiDocDITA.MismatchedId:The quotes in the ID are mismatched." ]
  [ "${lines[5]}" = "report_mismatched_quotes.adoc:18:1:AsciiDocDITA.MismatchedId:The quotes in the ID are mismatched." ]
}
