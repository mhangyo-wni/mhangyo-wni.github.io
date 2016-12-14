---
layout: default
---

# 萩行 正嗣 (HONGYO, Masatsugu)

## 株式会社ウェザーニューズ AIイノベーションセンター所属
2014年3月、[京都大学黒橋・河原研究室](http://nlp.ist.i.kyoto-u.ac.jp/)にて博士(情報学)を取得。同年4月、株式会社ウェザーニューズに入社。現在は、自然言語処理や機械学習を活用した業務改善や新価値創造に取り組む一方で、機械学習技術の気象分野への応用に挑戦している。

# 略歴
{% assign list = site.data.careers %}
{% for career in list %}
 - {{ career }}
{% endfor %}

# 発表文献

### 国際会議
{% assign list = site.data.international_conference | sort:"date" %}
{% for publication in list reversed %}
{% include publication.html %}
{% endfor %}

### 論文誌
{% assign list = site.data.journal | sort:"date" %}
{% for publication in list reversed %}
{% include publication.html %}
{% endfor %}

### 国内学会等
{% assign list = site.data.domestic_conference | sort:"date" %}
{% for publication in list reversed %}
{% include publication.html %}
{% endfor %}

### 学士論文
{% assign list = site.data.thesis | sort:"date" %}
{% for publication in list reversed %}
{% include publication.html %}
{% endfor %}


# 掲載情報等
{% assign list = site.data.news | sort:"date" %}
{% for article in list reversed %}
{% include news.html %}
{% endfor %}


