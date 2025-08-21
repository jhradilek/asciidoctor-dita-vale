load test_helper

@test "Ignore content inside of line and block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore content in other sections" {
  run run_vale "$BATS_TEST_FILENAME" ignore_other_sections.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore supported attribute lists" {
  run run_vale "$BATS_TEST_FILENAME" ignore_attribute_lists.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore supported attribute references" {
  run run_vale "$BATS_TEST_FILENAME" ignore_attribute_references.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore conditional directives" {
  run run_vale "$BATS_TEST_FILENAME" ignore_conditionals.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore include directives in assemblies" {
  run run_vale "$BATS_TEST_FILENAME" ignore_assembly_includes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore valid lines with all link variations" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_lines.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report content other than links in additional resources" {
  run run_vale "$BATS_TEST_FILENAME" report_non_links.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" = "report_non_links.adoc:4:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
  [ "${lines[1]}" = "report_non_links.adoc:6:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
  [ "${lines[2]}" = "report_non_links.adoc:7:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
}

@test "Report unsupported attribute lists" {
  run run_vale "$BATS_TEST_FILENAME" report_attribute_lists.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 4 ]
  [ "${lines[0]}" = "report_attribute_lists.adoc:6:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
  [ "${lines[1]}" = "report_attribute_lists.adoc:7:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
  [ "${lines[2]}" = "report_attribute_lists.adoc:11:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
  [ "${lines[3]}" = "report_attribute_lists.adoc:12:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
}

@test "Recognize additional resources title variations" {
  run run_vale "$BATS_TEST_FILENAME" report_valid_sections.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" = "report_valid_sections.adoc:4:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
  [ "${lines[1]}" = "report_valid_sections.adoc:6:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
  [ "${lines[2]}" = "report_valid_sections.adoc:7:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
}
