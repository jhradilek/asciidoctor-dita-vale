load test_helper

@test "Ignore links in additional resources" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_links.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore links in other module types" {
  run run_vale "$BATS_TEST_FILENAME" ignore_other_modules.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore links in code blocks" {
  run run_vale "$BATS_TEST_FILENAME" ignore_code_blocks.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore escaped links" {
  run run_vale "$BATS_TEST_FILENAME" ignore_escaped_links.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report all link variations outside of additional resources" {
  run run_vale "$BATS_TEST_FILENAME" report_invalid_links.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 16 ]
  [ "${lines[0]}" = "report_invalid_links.adoc:6:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[1]}" = "report_invalid_links.adoc:7:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[2]}" = "report_invalid_links.adoc:8:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[3]}" = "report_invalid_links.adoc:9:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[4]}" = "report_invalid_links.adoc:10:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[5]}" = "report_invalid_links.adoc:11:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[6]}" = "report_invalid_links.adoc:12:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[7]}" = "report_invalid_links.adoc:13:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[8]}" = "report_invalid_links.adoc:14:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[9]}" = "report_invalid_links.adoc:15:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[10]}" = "report_invalid_links.adoc:23:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[11]}" = "report_invalid_links.adoc:24:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[12]}" = "report_invalid_links.adoc:25:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[13]}" = "report_invalid_links.adoc:26:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[14]}" = "report_invalid_links.adoc:27:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[15]}" = "report_invalid_links.adoc:28:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
}

@test "Report links with attribute references" {
  run run_vale "$BATS_TEST_FILENAME" report_attribute_references.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 23 ]
  [ "${lines[0]}" = "report_attribute_references.adoc:6:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[1]}" = "report_attribute_references.adoc:7:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[2]}" = "report_attribute_references.adoc:8:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[3]}" = "report_attribute_references.adoc:9:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[4]}" = "report_attribute_references.adoc:11:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[5]}" = "report_attribute_references.adoc:12:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[6]}" = "report_attribute_references.adoc:13:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[7]}" = "report_attribute_references.adoc:15:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[8]}" = "report_attribute_references.adoc:16:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[9]}" = "report_attribute_references.adoc:17:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[10]}" = "report_attribute_references.adoc:18:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[11]}" = "report_attribute_references.adoc:20:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[12]}" = "report_attribute_references.adoc:21:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[13]}" = "report_attribute_references.adoc:22:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[14]}" = "report_attribute_references.adoc:24:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[15]}" = "report_attribute_references.adoc:25:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[16]}" = "report_attribute_references.adoc:27:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[17]}" = "report_attribute_references.adoc:28:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[18]}" = "report_attribute_references.adoc:29:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[19]}" = "report_attribute_references.adoc:31:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[20]}" = "report_attribute_references.adoc:32:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[21]}" = "report_attribute_references.adoc:33:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
  [ "${lines[22]}" = "report_attribute_references.adoc:34:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
}

@test "Report links in assemblies" {
  run run_vale "$BATS_TEST_FILENAME" report_assemblies.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_assemblies.adoc:6:3:AsciiDocDITA.ConceptLink:Move all links and cross references to Additional resources." ]
}
