load test_helper

@test "Ignore content inside of line and block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore valid AsciiDoc maps" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_map.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore the :chunk-to-content: attribute in maps" {
  run run_vale "$BATS_TEST_FILENAME" ignore_chunk_attribute.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report includes with missing toc=\"no\" in maps" {
  run run_vale "$BATS_TEST_FILENAME" report_invalid_lines.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" = "report_invalid_lines.adoc:9:1:AsciiDocDITA.MapToc:The toc=\"no\" attribute is missing." ]
  [ "${lines[1]}" = "report_invalid_lines.adoc:11:1:AsciiDocDITA.MapToc:The toc=\"no\" attribute is missing." ]
  [ "${lines[2]}" = "report_invalid_lines.adoc:17:1:AsciiDocDITA.MapToc:The toc=\"no\" attribute is missing." ]
}

@test "Report includes with missing toc=\"no\" in assemblies" {
  run run_vale "$BATS_TEST_FILENAME" report_assembly_includes.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" = "report_assembly_includes.adoc:12:1:AsciiDocDITA.MapToc:The toc=\"no\" attribute is missing." ]
  [ "${lines[1]}" = "report_assembly_includes.adoc:14:1:AsciiDocDITA.MapToc:The toc=\"no\" attribute is missing." ]
  [ "${lines[2]}" = "report_assembly_includes.adoc:20:1:AsciiDocDITA.MapToc:The toc=\"no\" attribute is missing." ]
}

@test "Report includes with missing toc=\"no\" in assemblies with :chunk-to-content:" {
  run run_vale "$BATS_TEST_FILENAME" report_chunk_attribute.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_chunk_attribute.adoc:12:1:AsciiDocDITA.MapToc:The toc=\"no\" attribute is missing." ]
  [ "${lines[1]}" = "report_chunk_attribute.adoc:18:1:AsciiDocDITA.MapToc:The toc=\"no\" attribute is missing." ]
}
