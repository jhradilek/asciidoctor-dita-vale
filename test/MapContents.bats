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

@test "Report invalid lines in AsciiDoc maps" {
  run run_vale "$BATS_TEST_FILENAME" report_invalid_lines.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 9 ]
  [ "${lines[0]}" = "report_invalid_lines.adoc:6:1:AsciiDocDITA.MapContents:Maps only support document titles, IDs, include directives, and attribute definitions." ]
  [ "${lines[1]}" = "report_invalid_lines.adoc:8:1:AsciiDocDITA.MapContents:Maps only support document titles, IDs, include directives, and attribute definitions." ]
  [ "${lines[2]}" = "report_invalid_lines.adoc:9:1:AsciiDocDITA.MapContents:Maps only support document titles, IDs, include directives, and attribute definitions." ]
  [ "${lines[3]}" = "report_invalid_lines.adoc:10:1:AsciiDocDITA.MapContents:Maps only support document titles, IDs, include directives, and attribute definitions." ]
  [ "${lines[4]}" = "report_invalid_lines.adoc:11:1:AsciiDocDITA.MapContents:Maps only support document titles, IDs, include directives, and attribute definitions." ]
  [ "${lines[5]}" = "report_invalid_lines.adoc:13:1:AsciiDocDITA.MapContents:Maps only support document titles, IDs, include directives, and attribute definitions." ]
  [ "${lines[6]}" = "report_invalid_lines.adoc:14:1:AsciiDocDITA.MapContents:Maps only support document titles, IDs, include directives, and attribute definitions." ]
  [ "${lines[7]}" = "report_invalid_lines.adoc:16:1:AsciiDocDITA.MapContents:Maps only support document titles, IDs, include directives, and attribute definitions." ]
  [ "${lines[8]}" = "report_invalid_lines.adoc:17:1:AsciiDocDITA.MapContents:Maps only support document titles, IDs, include directives, and attribute definitions." ]
}
