load test_helper

@test "Ignore content inside of line and block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore other content types" {
  run run_vale "$BATS_TEST_FILENAME" ignore_other_types.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore valid AsciiDoc maps" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_map.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report includes with missing toc=\"no\" attrributes" {
  run run_vale "$BATS_TEST_FILENAME" report_invalid_lines.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" = "report_invalid_lines.adoc:9:1:AsciiDocDITA.MapToc:The toc=\"no\" attribute is missing." ]
  [ "${lines[1]}" = "report_invalid_lines.adoc:11:1:AsciiDocDITA.MapToc:The toc=\"no\" attribute is missing." ]
  [ "${lines[2]}" = "report_invalid_lines.adoc:17:1:AsciiDocDITA.MapToc:The toc=\"no\" attribute is missing." ]
}
