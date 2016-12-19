---
layout: post
title: "EMNLP読み会@京大黒橋・河原研に参加しました"
date: 2016-12-19 16:02:00 +09:00
comments: false
---

12月8日に京都大学黒橋・河原研で開催されたEMNLPの論文読み会に参加してきました。

私は

- <h4>Distinguishing Past, On-going, and Future Events: The EventStatus Corpus</h4>
Ruihong Huang; Ignacio Cases; Dan Jurafsky; Cleo Condoravdi; Ellen Riloff<br>
[pdf](www.aclweb.org/anthology/D/D16/D16-1005.pdf)

という論文を紹介しました([資料]({{ site.baseurl}}/slides/HangyoEMNLPPaperReading2016.pptx))。
この論文では、時間情報の新しいタグ付けを提案しています。具体的には、記述された時に対して、イベントがPast(過去)、OnGoing(発生中)、Future(未来)[^past]のどの状態にあるかをタグ付けしています。今回はアノテーション対象を「市民の暴動」に関連するイベントに限定していますが、ハリケーンのような自然災害でも同じようにタグ付けできるようです。
作成したコーパスに対して、SVMとCNNの2種類のモデルを構築して3値分類の実験を行なっています。実験結果はCNNが一番よいのですが、SVMでもCNNとそれほど変わらない精度が得られています。また、独自の素性として、Future Oriented Lexiconというのを提案しているのですが、タスクに合った素性に設計で非常に面白いと思いました。

感想としては、時間関係コーパスとしてはTimeMLなどがありますが、今回の実験設定の方がアノテーションが容易で実用的ではないかと感じました。
また、SVMでもそれなりの精度が得られるのも、実用で使いやすいと思います。
実は似たような研究をColing併催のW-NUTというworkshopで[発表した](http://www.aclweb.org/anthology/W/W16/W16-3906.pdf)ので、もうちょっと頑張ればトップカンファレンス狙えるネタだったかなあ、と思いました。

[^past]:Futureは実際には、Future-Planned、Future-Alert、Future-Possibleの3種類に分けてタグ付けしている。

発表を聞いた中で特に面白いと感じたものをいくつか紹介しておきます。

----------------

- <h4>Deep Reinforcement Learning for Mention-Ranking Coreference Models</h4>
Kevin Clark; Christopher D. Manning
[pdf](http://www.aclweb.org/anthology/D/D16/D16-1245.pdf)

黒橋研の柴田先生の紹介。共参照解析を強化学習として定式化した話。強化学習を使うことで、共参照解析の評価指標を直接的に最大化できるらしい。
機械学習を使ったNLPでよくある、機械学習で解いている個々の問題は多値分類だけど、評価は全体で一つの指標、みたいな問題全般で使えそう。
実は、この会の前に自分で読んだ時は何が嬉しいのかよく分からなかったので、読み会に参加してよかった。

----------------

- <h4>How Transferable are Neural Networks in NLP Applications?</h4>
Lili Mou; Zhao Meng; Rui Yan; Ge Li; Yan Xu; Lu Zhang; Zhi Jin
[pdf](http://www.aclweb.org/anthology/D/D16/D16-1046.pdf)

NAISTの佐藤君の紹介。本人が[資料](http://www.slideshare.net/moco03/emnlp2016)をアップロードしてくれています。
NLPにおいて転移学習がどのような条件下で有効かを色々調べた論文。Embeddingは効くものの、LSTMやCNNのアウトプット層ではあまり有効ではない、という結果。
直感的には不思議ではないが、問題設定自体もあんまり転移学習が効かなさそうな設定な気がする。
画像と言語では深層学習で見ている情報の性質が違う気がするので、言語は言語で転移学習が有効に使えるネットワーク設計と転移のさせ方がありそう。

----------------

- <h4>Rationalizing Neural Predictions</h4>
 Tao Lei; Regina Barzilay; Tommi Jaakkola
[pdf](http://www.aclweb.org/anthology/D/D16/D16-1011.pdf)

NAISTの大内君の紹介。深層学習はブラックボックスだと言われるが、実用的には説明可能であることが好まれる。
多少性能を落しても、判断の根拠となった部分を提示するシステムを提案。
質疑の中で、「判断の根拠だけこれを使って提示して、一番性能がいいものを使えば」というコメントがあったのだけど、それは結局、根拠と判断が一致しない事例が出てくるので、システムへの不信に繋がるのであまり良くないと思った。




----------------

- <h4>Building an Evaluation Scale using Item Response Theory</h4>
John Lalor; Hao Wu; hong yu
[pdf](http://www.aclweb.org/anthology/D/D16/D16-1062.pdf)

京大の大谷君の紹介。項目反応理論を使って、異なるデータセット間でも統一的な解析器の性能を評価できるようにする手法の提案。
確かに、同じタスクでもデータセットごとの難易度が違っていて、あるデータセットでの評価の数字をどう捉えるかは、結構人間の感覚でやっているので、こういった指標はいいかもしれない。

----------------

- <h4>SQuAD: 100,000+ Questions for Machine Comprehension of Text</h4>
Pranav Rajpurkar; Jian Zhang; Konstantin Lopyrev; Percy Liang
[pdf](http://www.aclweb.org/anthology/D/D16/D16-1264.pdf)

こちらも大谷君の紹介。でっかいデータセット作って公開しましたよ、という話なのだが、EMNLPの開催時点で既にこれを活用した研究が盛んに行なわれていて、既に論文に載っている数字より遥かに高い次元で研究が行なわれているらしい。
それらの研究をEMNLPでの発表の中でも紹介していたらしく、今までにないスピード感で分野全体として研究が進んでいると感じた。

----------------

- <h4>Does String-Based Neural MT Learn Source Syntax?</h4>
Xing Shi; Inkit Padhi; Kevin Knight
[pdf](http://www.aclweb.org/anthology/D/D16/D16-1159.pdf)

JSTの中澤さんの紹介。Neural MTが文法的な内容を学習しているか、ということを実験的に調べた研究。
結果としては、Tenseなどの情報を隠れ層に持つように学習するらしい。
文法的な内容もしっかりとNeural MTで認識できるようになるなら、対訳コーパスが用意できるなら、従来の単言語での解析が必要なくなるのでは、という期待と怖さ[^nakazawa-paper]がある。
あと、こういうレイヤーの情報なら転移学習でも使えるのではないかと思ったり。


[^nakazawa-paper]:単言語特化でやってきた研究者として研究のネタがなくなるのでは、という怖さ。分野として見た場合は期待が大きいと思います。

----------------

- <h4>Why Neural Translations are the Right Length</h4>
Xing Shi; Kevin Knight; Deniz Yuret
[pdf](http://www.aclweb.org/anthology/D/D16/D16-1248.pdf)

こちらも中澤さんの紹介。Neural MTには長さを管理してるセルがいるのではないか、ということを検証した論文。
結論は、どうもYesらしいとのこと。

内容的に凄い結果ということはないのだけど、こういう分析をしてNeural MTの挙動を少しでも理解しようとするのは今後大事になってくるのではと思った。
多分だけど、学習がうまく進んでいるか、などを把握する手掛りになると思うので。

----------------
