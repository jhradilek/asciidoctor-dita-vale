load test_helper

@test "Ignore references to potentially problematic attributes" {
  run run_vale "$BATS_TEST_FILENAME" ignore_attribute_references.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore unset attributes" {
  run run_vale "$BATS_TEST_FILENAME" ignore_unset_attributes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore text resembling problematic attribute definitions" {
  run run_vale "$BATS_TEST_FILENAME" ignore_text.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report potentially problematic attribute definitions" {
  run run_vale "$BATS_TEST_FILENAME" report_problematic_attributes.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_problematic_attributes.adoc:3:1:AsciiDocDITA.AttributeDefinition::data-uri:" ]
  [ "${lines[1]}" = "report_problematic_attributes.adoc:4:1:AsciiDocDITA.AttributeDefinition::data-uri: A custom value" ]
}
