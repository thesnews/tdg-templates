{#gryphon/section/templates/dropnav.tpl#}


{% helper request %}
<!-- Start "Multimedia" -->
{% if request.get('t', 'alnum') == 'multimedia' %}
	{% fetch mm from gryphon:media with [
		'order': 'created desc',
		'limit': '4',
		'where': 'status = 1',
		'withTags': ['multimedia|multimedia_box']
	] %}
	<div class="span10 hidden-tablet hidden-phone">
    	<div class="row-fluid">
			{% for item in mm %}
				<div class="span3 divide-line-right hidden-tablet hidden-phone">
					<article>
						<div class="photo-wrap" style="width:100%;height:150px;">
							{% if item.type == 'audio' %}
								<a href="{{ item.urlDefault }}">
									<img src="{{ 'assets/dist/images/audio-icon.png' | asset }}" />
								</a>
							{% else %}
								<a href="{% if item.gallery %}{{ item.gallery.urlDefault }}{% else %}{{ item.urlDefault }}{% endif %}">
									<img src="{{ item.urlPreview }}" />
								</a>
							{% endif %}
						</div>
						<h4 style="margin-top:10px;"><a href="{% if item.gallery %}{{ item.gallery.urlDefault }}{% else %}{{ item.urlDefault }}{% endif %}" style="max-height:150px;">{{ item.title }}</a></h4>
					</article>
				</div>
			{% endfor %}
		</div>
	</div>
	<div class="span2">
		{% set slug = request.get('t', 'alnum') %}
		<ul class="nav nav-list">
			<li class="nav-header">MORE</li>
			<li class="more-list"><a href="{{ 'multimedia/video'|url }}">Video</a></li>
			<li class="more-list"><a href="{{ 'gallery'|url }}">Galleries</a></li>
			<li class="more-list"><a href="{{ 'multimedia/audio'|url }}">Audio</a></li>
			<li class="more-list"><a href="{{ 'multimedia/flash'|url }}">Interactives</a></li>
		</ul>
	</div>
<!-- End "Multimedia" -->

<!-- Start "Blogs" -->
{% elseif request.get('t', 'alnum') == 'blog' %}
	{% fetch posts from blogPost with [
		'where': 'status = 1',
		'order': 'created desc',
		'limit': 3
	]%}
  <div class="span10">
    <div class="row-fluid">
    	{% for post in posts %}
			<div class="span4">
				<article>
					<h6><a href="{{ post.blog.url }}">{{ post.blog.name }}</a></h6>
					<h4><a href="{{ post.url }}">{{ post.headline }}</a></h4>
					<aside>
		        		<span class="byline-drop-1">
						  {% if post.authors.length %}
							    By: {{ post.authors.splat('name')|join(', ') }}
						  {% else %}
						    &nbsp;
						  {% endif %}
					    </span>
					</aside>
					<p class="copy">{{ post.abstract_formatted|clip(200) }}</p>
				</article>
			</div>
		{% endfor %}
    </div>
  </div>
  <div class="span2">
  {% set slug = request.get('t', 'alnum') %}
    <ul class="nav nav-list">
      <li class="nav-header">MORE</li>
		{% fetch blogs from blog with [
			'order': 'name asc',
			'where': 'status = 1'
		]%}
		{% for blog in blogs %}
			<li class="more-list"><a href = "{{ blog.url }}">{{ blog.name }}</a></li>
		{% endfor %}
    </ul>
  </div>
<!-- End "Blogs" -->

<!-- Start "Home", "News", "Viewpoints", "The Mix", and "Sports" -->
{% else %}
	{% fetch articles from article with	[
		'where': 'status = 1',
		'order': 'weight desc, created desc',
		'limit': '8',
		'withTags': [request.get('t', 'alnum')]
	] %}

<div class="span5">
  <div class="row-fluid">
		<div class="span6">
				{% set article = articles.shift() %}
				{% set topStory = article.media.grab('type', 'image')[0] %}
				<article>
					{% if topStory %}
						<div class="photo-wrap" style="width:100%;height:150px;">
							<a href="{{ article.url }}"><img src="{{ topStory.urlPreview }}" style="max-height:150px;"/></a>
						</div>
					{% endif %}
					<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
					<aside>
		        <span class="byline-drop-1">
						  {% if article.authors.length %}
						    By: {{ article.authors.splat('name')|join(', ') }}
						  {% else %}
						    &nbsp;
						  {% endif %}
				    </span>
					</aside>
					{% if not topStory %}
						<p class="copy">{{ article.abstract_formatted|clip(200) }}</p>
					{% endif %}
				</article>
		</div>
		<div class="span6">
				{% set article = articles.shift() %}
				{% set topMedia = article.media.grab('type', 'image')[0] %}
				<article>
					{% if topMedia %}
						<div class="photo-wrap" style="width:100%;height:150px;">
							<a href="{{ article.url }}"><img src="{{ topMedia.urlPreview }}" style="max-height:150px;" /></a>
						</div>
					{% endif %}
					<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
					<aside>
				    <span class="byline-drop-1">
						  {% if article.authors.length %}
						    By: {{ article.authors.splat('name')|join(', ') }}
						  {% else %}
						    &nbsp;
						  {% endif %}
				    </span>
					</aside>
					{% if not topMedia %}
						<p class="copy">{{ article.abstract_formatted|clip(100) }}</p>
					{% endif %}
				</article>
			</div>
		</div>
	</div>
<div class="span5">
  <div class="row-fluid">
		<div class="span6">
				{% for article in articles.shift(3) %}
					<article>
						<h6 class="title-drop"><a href="{{ article.url }}">{{ article.headline }}</a></h6>
						<aside>
						  <span class="byline-drop-2">
						    {% if article.authors.length %}
								  By: {{ article.authors.splat('name')|join(', ') }}
						    {% else %}
								  &nbsp;
						    {% endif %}
						  </span>
						</aside>
					</article>
					<hr class="half spacer" />
				{% endfor %}
    </div>
		<div class="span6">
				{% for article in articles.shift(3) %}
					<article>
						<h6 class="title-drop"><a href="{{ article.url }}">{{ article.headline }}</a></h6>
						<aside>
						  <span class="byline-drop-2">
						    {% if article.authors.length %}
								  By: {{ article.authors.splat('name')|join(', ') }}
						    {% else %}
								  &nbsp;
						    {% endif %}
						  </span>
						</aside>
					</article>
					<hr class="half spacer" />
				{% endfor %}
			</div>
		</div>
	</div>
	<div class="span2">
		{% set slug = request.get('t', 'alnum') %}
		<ul class="nav nav-list">
			{% if not slug or slug == 'top_stories' %}
				<li class="nav-header">MORE</li>
				<li class="more-list"><a href="{{ 'page/classifieds'|url }}">Classifieds</a></li>
			{% elseif slug == 'news' %}
				<li class="nav-header">MORE</li>
				<li class="more-list"><a href="{{ 'section/campus'|url }}">Campus</a></li>
				<li class="more-list"><a href="{{ 'section/columbia'|url }}">Columbia</a></li>
				<li class="more-list"><a href="{{ 'section/in-brief'|url }}">In Brief</a></li>
				<li class="more-list"><a href="{{ 'section/crime-blotter'|url }}">Crime Blotter</a></li>
			{% elseif slug == 'viewpoints' %}
				<li class="nav-header">MORE</li>
				<!--li class="more-list"><a href="{{ 'section/opinion'|url }}">Opinions</a></li-->
				<li class="more-list"><a href="{{ 'section/guest-column'|url }}">Columns</a></li>
				<li class="more-list"><a href="{{ 'section/letters-to-the-editor'|url }}">Letters</a></li>
		    {% elseif slug == 'mix' %}
				<li class="nav-header">MORE</li>
				<li class="more-list"><a href="{{ 'section/culture'|url }}">Culture</a></li>
				<li class="more-list"><a href="{{ 'section/movies'|url }}">Movies</a></li>
				<li class="more-list"><a href="{{ 'section/music'|url }}">Music</a></li>
				<li class="more-list"><a href="{{ 'section/arts'|url }}">Arts</a></li>
			{% elseif slug == 'sports' %}
				<li class="nav-header">MORE</li>
				<li class="more-list"><a href="{{ 'section/football'|url }}">Football</a></li>
				<li class="more-list"><a href="{{ 'section/basketball'|url }}">Basketball</a></li>
				<li class="more-list"><a href="{{ 'section/soccer'|url }}">Soccer</a></li>
				<li class="more-list"><a href="{{ 'section/baseball'|url }}">Baseball</a></li>
				<li class="more-list"><a href="{{ 'section/softball'|url }}">Softball</a></li>
			{% endif %}
		</ul>
	</div>
<!-- End "Home", "News", "Viewpoints", "The Mix", and "Sports" -->
{% endif %}
