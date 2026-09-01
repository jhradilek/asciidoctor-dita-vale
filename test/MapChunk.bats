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

@test "Report includes with nested chunk=\"to-content\" attributes in maps" {
  run run_vale "$BATS_TEST_FILENAME" report_invalid_lines.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_invalid_lines.adoc:11:1:AsciiDocDITA.MapChunk:The chunk=\"to-content\" attribute cannot be nested." ]
  [ "${lines[1]}" = "report_invalid_lines.adoc:17:1:AsciiDocDITA.MapChunk:The chunk=\"to-content\" attribute cannot be nested." ]
}

@test "Report includes with nested chunk=\"to-content\" attributes in assemblies" {
  run run_vale "$BATS_TEST_FILENAME" report_assembly_includes.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_assembly_includes.adoc:14:1:AsciiDocDITA.MapChunk:The chunk=\"to-content\" attribute cannot be nested." ]
  [ "${lines[1]}" = "report_assembly_includes.adoc:20:1:AsciiDocDITA.MapChunk:The chunk=\"to-content\" attribute cannot be nested." ]
}

@test "Report all includes with chunk=\"to-content\" attribute in assemblies with :chunk-to-content:" {
  run run_vale "$BATS_TEST_FILENAME" report_chunk_attribute.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 4 ]
  [ "${lines[0]}" = "report_chunk_attribute.adoc:12:1:AsciiDocDITA.MapChunk:The chunk=\"to-content\" attribute cannot be nested." ]
  [ "${lines[1]}" = "report_chunk_attribute.adoc:16:1:AsciiDocDITA.MapChunk:The chunk=\"to-content\" attribute cannot be nested." ]
  [ "${lines[2]}" = "report_chunk_attribute.adoc:20:1:AsciiDocDITA.MapChunk:The chunk=\"to-content\" attribute cannot be nested." ]
  [ "${lines[3]}" = "report_chunk_attribute.adoc:22:1:AsciiDocDITA.MapChunk:The chunk=\"to-content\" attribute cannot be nested." ]
}

