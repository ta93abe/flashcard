INSERT INTO card_types (id, label, description, grading, ui_component) VALUES
('single_select', '4択1正解',     '選択肢から1つ選ぶ',               'exact_match',     'SingleSelect'),
('multi_select',  '複数選択',     '正解が複数ある選択問題',           'partial_credit',  'MultiSelect'),
('domc',          '逐次正誤判定', '選択肢を1つずつ正誤判定する',       'partial_credit',  'DOMC'),
('fill_blank',    '穴埋め',       'テキスト入力で空欄を埋める',       'fuzzy_text',      'FillBlank'),
('free_recall',   '自由記述',     '知識を自由に記述する',             'llm_judge',       'FreeRecall'),
('matching',      '対応付け',     '左右の項目をマッチングする',       'set_match',       'Matching'),
('ordering',      '並べ替え',     '正しい順序に並べる',               'ordered_match',   'Ordering'),
('hotspot',       '画像領域選択', '画像上の正しい領域をタップする',    'region_hit',      'Hotspot'),
('scenario',      'シナリオ問題', 'シナリオに紐づく問題群',           'composite',       'Scenario');
