---
layout: page
title: Unidade01
permalink: /unidade01/
---
Unidade 01: Que é o computador? 
--- 

<h3>Prácticas da unidade01</h3>

<ul>
{% assign entradas = site.posts | sort: 'date' %}
  {% for post in entradas %}
   {% if post.categories contains "unidade01" %}
            <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
   {% endif %}
  {% endfor %}
</ul>

<h3>Resumos da unidade01</h3>

<ul>
{% assign entradas = site.posts | sort: 'date' %}
  {% for post in entradas %}
   {% if post.categories contains "unidade01" %}
     {% if post.categories contains "resumo" %}
      <h2><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h2>
     
     {% endif %}
   {% endif %}
  {% endfor %}
</ul>

ola

<h3> "{{site.url"}}</h3>

