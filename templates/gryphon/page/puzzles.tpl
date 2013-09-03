{# gryphon/page/puzzles.tpl #}
{% extends "gryphon/base.tpl" %}
{% block title %} :: Puzzles{% endblock %}

{% block active %}{% endblock %}
{% block subActive %}Puzzles{% endblock %}

{% block content %}
<div class= "row">
	<div class="span8">
		<h1>Puzzles</h1>

		<hr class="hairline" />
		<article>

			<h4>Recent print edition solutions</h4>
			{% fetch puzzles from gryphon:media with [
				'where': 'media:status = 1',
				'order': 'media:created desc',
				'limit': '10',
				'withTags': ['solutions']
			] %}
			<ul>
				{% for puzzle in puzzles %}
					<li><a href="{{ puzzle.urlOriginal }}">{{ puzzle.title }}</a></li>
				{% endfor %}
			</ul>
		</article>
	</div>

	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

	<div class="clear"></div>
</div>
{% endblock content %}