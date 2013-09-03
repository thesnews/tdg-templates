{# gryphon/page/templates/about.tpl #}

{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ page.title }}{% endblock %}
{% block description %}{{ page.content_formatted|striptags|clip(400) }}{% endblock %}
{% block activeNav %}{{ active }}{% endblock %}

{% block styles %}

{% endblock %}

{% block scripts %}
{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}

<div class="row">
	<div class="span8 page">

		<h1>About the Daily Gamecock</h1>

		<hr class="hairline" />

		<p>The Daily Gamecock is the editorially independent student newspaper at the University of South Carolina. The print version is published Monday through Friday during the fall and spring semesters and nine times during the summer, with the exception of university holidays and exam periods. Dailygamecock.com is your online source for The Daily Gamecock's coverage of all things USC. Check us out on Facebook (The Daily Gamecock) and Twitter (@thegamecock) for news updates around the clock.</p>

		<p>Opinions expressed in The Daily Gamecock are those of the editors or author and not those of the University of South Carolina. Unsigned editorials represent the majority opinion of the editorial board and are the official opinion of the newspaper.</p>

		<p>With a circulation of about 12,000, The Daily Gamecock is South Carolina's 15th largest newspaper, according to the South Carolina Press Association, and has been publishing since 1908.</p>

		<p>The Daily Gamecock was named the 14th Best Student Newspaper in the U.S. in the 2012 Princeton Review rankings.</p>

		<p>Subscribe to The Daily Gamecock newspaper! To have the newspaper mailed to your home for $60/year, call 803-777-3888.</p>

		<hr class="spacer" />

		{{ page.content }}
	</div>

	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

</div>

{% endblock content %}
