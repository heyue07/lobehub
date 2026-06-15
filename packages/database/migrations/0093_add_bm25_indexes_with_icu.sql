-- Custom SQL migration file, put your code below! --
-- All tables include user_id (keyword tokenizer + fast) for filter pushdown into tantivy index scan.
-- Enum/filter fields (type, status, role, etc.) use keyword+fast for the same reason.
-- Large tables (documents, messages) are placed last to avoid blocking smaller index builds.

-- 1. agents: title, description, slug, tags(jsonb), system_role, user_id
DROP INDEX IF EXISTS agents_bm25_idx;

-- 2. topics: title, content, description, user_id
DROP INDEX IF EXISTS topics_bm25_idx;

-- 3. files: name, user_id, file_type
DROP INDEX IF EXISTS files_bm25_idx;

-- 4. knowledge_bases: name, description, user_id
DROP INDEX IF EXISTS knowledge_bases_bm25_idx;

-- 5. user_memories: title, summary, details, memory_layer, memory_category, status, user_id
DROP INDEX IF EXISTS user_memories_bm25_idx;

-- 6. chat_groups: title, description, content, user_id
DROP INDEX IF EXISTS chat_groups_bm25_idx;

-- 7. user_memories_contexts: title, description, current_status, type, user_id
DROP INDEX IF EXISTS user_memories_contexts_bm25_idx;

-- 8. user_memories_preferences: conclusion_directives, suggestions, type, user_id
DROP INDEX IF EXISTS user_memories_preferences_bm25_idx;

-- 9. user_memories_activities: notes, narrative, feedback, type, status, user_id
DROP INDEX IF EXISTS user_memories_activities_bm25_idx;

-- 10. user_memories_identities: description, role, type, relationship, user_id
DROP INDEX IF EXISTS user_memories_identities_bm25_idx;

-- 11. user_memories_experiences: situation, reasoning, possible_outcome, action, key_learning, type, user_id
DROP INDEX IF EXISTS user_memories_experiences_bm25_idx;

-- 12. user_memory_persona_documents: tagline, persona, user_id
DROP INDEX IF EXISTS user_memory_persona_documents_bm25_idx;

-- 13. documents (large table): title, description, content, slug, user_id, file_type, source_type
DROP INDEX IF EXISTS documents_bm25_idx;

-- 14. messages (largest table): content, summary, user_id, role
DROP INDEX IF EXISTS messages_bm25_idx;
