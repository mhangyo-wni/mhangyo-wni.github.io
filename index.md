---
layout: default
---

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




