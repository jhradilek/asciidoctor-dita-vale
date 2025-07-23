load test_helper

@test "Ignore links without attribute references" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_links.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore bash variables" {
  run run_vale "$BATS_TEST_FILENAME" ignore_bash_variables.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore replaceable content" {
  run run_vale "$BATS_TEST_FILENAME" ignore_replaceable_values.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report links with attribute references" {
  run run_vale "$BATS_TEST_FILENAME" report_attribute_references.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 7 ]
  [ "${lines[0]}" = "report_attribute_references.adoc:2:1:AsciiDocDITA.LinkAttribute:Attribute references inside of links cannot be converted to DITA." ]
  [ "${lines[1]}" = "report_attribute_references.adoc:4:1:AsciiDocDITA.LinkAttribute:Attribute references inside of links cannot be converted to DITA." ]
  [ "${lines[2]}" = "report_attribute_references.adoc:6:1:AsciiDocDITA.LinkAttribute:Attribute references inside of links cannot be converted to DITA." ]
  [ "${lines[3]}" = "report_attribute_references.adoc:8:1:AsciiDocDITA.LinkAttribute:Attribute references inside of links cannot be converted to DITA." ]
  [ "${lines[4]}" = "report_attribute_references.adoc:10:1:AsciiDocDITA.LinkAttribute:Attribute references inside of links cannot be converted to DITA." ]
  [ "${lines[5]}" = "report_attribute_references.adoc:12:1:AsciiDocDITA.LinkAttribute:Attribute references inside of links cannot be converted to DITA." ]
  [ "${lines[6]}" = "report_attribute_references.adoc:14:1:AsciiDocDITA.LinkAttribute:Attribute references inside of links cannot be converted to DITA." ]
}
