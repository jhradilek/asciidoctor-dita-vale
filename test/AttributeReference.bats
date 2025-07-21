load test_helper

@test "Ignore character replacement attribute references" {
  run run_vale "$BATS_TEST_FILENAME" ignore_character_replacements.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report custom attribute references" {
  run run_vale "$BATS_TEST_FILENAME" report_custom_attributes.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 5 ]
  [ "${lines[0]}" = "report_custom_attributes.adoc:3:17:AsciiDocDITA.AttributeReference:{product-name}" ]
  [ "${lines[1]}" = "report_custom_attributes.adoc:3:32:AsciiDocDITA.AttributeReference:{product-version}" ]
  [ "${lines[2]}" = "report_custom_attributes.adoc:5:1:AsciiDocDITA.AttributeReference:{DocumentTitle}" ]
  [ "${lines[3]}" = "report_custom_attributes.adoc:5:27:AsciiDocDITA.AttributeReference:{product-name}" ]
  [ "${lines[4]}" = "report_custom_attributes.adoc:7:6:AsciiDocDITA.AttributeReference:{BASE_URL}" ]
}

@test "Report counter attributes" {
  run run_vale "$BATS_TEST_FILENAME" report_counters.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 6 ]
  [ "${lines[0]}" = "report_counters.adoc:3:8:AsciiDocDITA.AttributeReference:{counter:node}" ]
  [ "${lines[1]}" = "report_counters.adoc:4:8:AsciiDocDITA.AttributeReference:{counter:node}" ]
  [ "${lines[2]}" = "report_counters.adoc:5:8:AsciiDocDITA.AttributeReference:{counter:node}" ]
  [ "${lines[3]}" = "report_counters.adoc:7:1:AsciiDocDITA.AttributeReference:{counter2:node}" ]
  [ "${lines[4]}" = "report_counters.adoc:9:10:AsciiDocDITA.AttributeReference:{counter:opt:A}" ]
  [ "${lines[5]}" = "report_counters.adoc:10:10:AsciiDocDITA.AttributeReference:{counter:opt:A}" ]
}
