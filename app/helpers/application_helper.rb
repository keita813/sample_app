module ApplicationHelper
# ページごとの完全なタイトルを返します
    # メソッド定義とオプション引数
	def full_title(page_title = '')
		#変数への代入 
		base_title = "Ruby on Rails Tutorial Sample App"
		# 理論値テスト
		if page_title.empty?
			# 暗黙の戻り値
			base_title
		else
			# 文字列の結合
			page_title + " | " + base_title
		end
	end
end
