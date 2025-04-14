return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      show_help = "yes",
      prompts = {
        Explain = {
          prompt = "/COPILOT_EXPLAIN アクティブな選択範囲の説明を段落形式で書いてください。日本語で返答ください。",
          description = "コードの説明をお願いする",
        },
        Review = {
          prompt = "/COPILOT_REVIEW 選択されたコードをレビューしてください。日本語で返答ください。",
          description = "コードのレビューをお願いする",
        },
        FixCode = {
          prompt = "/COPILOT_GENERATE このコードには問題があります。バグを修正したコードに書き直してください。日本語で返答ください。",
          description = "コードの修正をお願いする",
        },
        Refactor = {
          prompt = "/COPILOT_GENERATE 明瞭性と可読性を向上させるために、次のコードをリファクタリングしてください。日本語で返答ください。",
          description = "コードのリファクタリングをお願いする",
        },
        Optimize = {
          prompt = "/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。説明は日本語でお願いします。",
          description = "コードの最適化をお願いする",
        },
        BetterNamings = {
          prompt = "/COPILOT_GENERATE 選択されたコードの変数名や関数名を改善してください。日本語で返答ください。",
          description = "変数名や関数名の改善をお願いする",
        },
        Documentation = {
          prompt = "/COPILOT_GENERATE 選択範囲にドキュメントコメントを追加してください。日本語で返答ください。",
          description = "コードのドキュメント作成をお願いする",
        },
        Tests = {
          prompt = "/COPILOT_GENERATE コードのテストを生成してください。日本語で返答ください。",
          description = "テストコード作成をお願いする",
        },
        Wording = {
          prompt = "/COPILOT_GENERATE 次のテキストの文法と表現を改善してください。日本語で返答ください。",
          description = "文法の修正をお願いする",
        },
        Summarize = {
          prompt = "/COPILOT_GENERATE 選択範囲の要約を書いてください。日本語で返答ください。",
          description = "コードの要約をお願いする",
        },
        Spelling = {
          prompt = "/COPILOT_GENERATE 次のテキストのスペルミスを修正してください。日本語で返答ください。",
          description = "スペルミスの修正をお願いする",
        },
        FixDiagnostic = {
          -- prompt = "ファイル内の次の問題を支援してください:",
          prompt = "コードの診断結果に従って問題を修正してください。修正内容の説明は日本語でお願いします。",
          description = "コードの修正をお願いする",
          selection = require("CopilotChat.select").diagnostics,
        },
      },
    },
  },
}
