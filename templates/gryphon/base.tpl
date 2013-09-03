{# gryphon/base.tpl#}

{% import "macros/render.tpl" as render %}
{% import "macros/disqus.tpl" as disqus %}
{% helper config %}
{% helper weather %}
{% helper issuuDoc %}
{% helper adpilotHelper as ads %}

{% set title %}{% block title %}{% endblock %}{% endset %}

{% set active %}{% block activeNav %}{% endblock %}{% endset %}

{% if not active %}
	{% set active = 'home' %}
{% endif %}
{% set bodyClass %}{% block bodyClass %}{% endblock %}{% endset %}

{% set description %}{% block description %}{% endblock %}{% endset %}
<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="generator" content="Gryphon {{ config.appVersion }} (Foundry {{ config.foundryVersion }})" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	{% if noIndex %}
		<meta name="robots" content="noindex, nofollow" />
	{% endif %}

	<link rel="apple-touch-icon-precomposed" href="{{ 'assets/dist/images/webclip.png'|asset }}" />

	<meta name="title" content="{{ config.get('publication:name') }}{{ title }}" />
	{% if title %}
		<title>{{ config.get('publication:name') }}{{ title }}</title>
	{% else %}
		<title>The Daily Gamecock</title>
	{% endif %}
  	<link rel="shortcut icon" href="{{ 'assets/dist/images/favicon.ico'|asset }}"/>
	<meta name="description" content="{{ description|default(siteSlogan) }}" />
	<meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet" type="text/css" href="{{ 'assets/dist/css/master.css'|asset }}" />

    <link rel="stylesheet" type="text/css" href="{{ 'assets/src/js/vendor/fancybox/jquery.fancybox.css'|asset }}" />
	<script type="text/javascript" src="{{ 'assets/src/js/gallery.js'|asset }}"></script>
    <script type="text/javascript" src="{{ 'assets/dist/js/master-min.js'|asset }}"></script>
    <script type="text/javascript" src="//use.typekit.net/jff8nfo.js"></script>
	<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
		
	
	
<!-- Google Adsense -->
	<script type='text/javascript'>
		var googletag = googletag || {};
		googletag.cmd = googletag.cmd || [];
		(function() {
			var gads = document.createElement('script');
			gads.async = true;
			gads.type = 'text/javascript';
			var useSSL = 'https:' == document.location.protocol;
			gads.src = (useSSL ? 'https:' : 'http:') + 
			'//www.googletagservices.com/tag/js/gpt.js';
			var node = document.getElementsByTagName('script')[0];
			node.parentNode.insertBefore(gads, node);
		})();
	</script>

	<script type='text/javascript'>
		googletag.cmd.push(function() {
			googletag.defineSlot('/95759330/TDG-button-top-left-120x90', [120, 90], 'div-gpt-ad-1373565909002-0').addService(googletag.pubads());
			googletag.defineSlot('/95759330/TDG-button-top-right-120x90', [120, 90], 'div-gpt-ad-1373565909002-1').addService(googletag.pubads());
			googletag.defineSlot('/95759330/TDG-leaderboard-top-728x90', [728, 90], 'div-gpt-ad-1373565909002-2').addService(googletag.pubads());
			googletag.defineSlot('/95759330/TDG-tower-left-bottom-120x250', [120, 250], 'div-gpt-ad-1373565909002-3').addService(googletag.pubads());
			googletag.defineSlot('/95759330/TDG-tower-right-bottom-120x250', [120, 250], 'div-gpt-ad-1373565909002-4').addService(googletag.pubads());
            googletag.defineSlot('/95759330/TDG-rectangle-rail-top-300x250', [300, 250], 'div-gpt-ad-1373578296077-0').addService(googletag.pubads());
			googletag.pubads().enableSingleRequest();
			googletag.enableServices();
		});
	</script>	
<!-- end Google -->


	{% block styles %}{% endblock %}
	{% block links %}{% endblock %}


	<link rel="alternate" type="application/rss+xml" title="{{ config.get('publication:name') }} : Top Stories" href="{{ 'section/pageOne'|url }}.xml" />

	<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet">
	<script src="http://vjs.zencdn.net/c/video.js"></script>
	
	<script src="{{ 'assets/src/js/vendor/audiojs/audio.min.js'|asset }}"></script>
	<script>
  		audiojs.events.ready(function() {
   		 var as = audiojs.createAll();
  		});
	</script>

	{% block scripts %}{% endblock %}

</head>
<body{% if bodyClass %} class="{{ bodyClass }}"{% endif %}>
	<div class="container">
		<hr class="spacer"/>
		<div class="row">
			<div class="span12 text-center hidden-phone">
				<div style="display:inline-block;padding-right:40px;" class="hidden-tablet hidden-phone">{% include 'gryphon/ads/button_left.tpl' %}</div>
				<div style="display:inline-block;">{% include 'gryphon/ads/leaderboard.tpl' %}</div>
				<div style="display:inline-block;padding-left:40px;" class="hidden-tablet hidden-phone">{% include 'gryphon/ads/button_right.tpl' %}</div>
			</div>
		</div>

		<hr class="spacer clearfix hidden-phone" />

		<header>
			<div class="row hidden-phone" id = "top-ticker">

				<div class="span6 text-left">
					<ul class="unstyled">
						<li><a href="{{ 'page/about'|url }}">about</a></li>
						<li><a href="{{ 'page/advertise'|url }}">advertising</a></li>
						<li><a href="{{ 'page/app'|url }}">app</a></li>
						<li><a href="{{ 'classified'|url }}">classifieds</a></li>
						<li><a href="{{ 'page/puzzles'|url }}">puzzles</a></li>
						<li><a href="{{ 'page/contact'|url }}">contact us</a></li>
					</ul>
				</div><!-- /.span6 -->

				<div class="span6 text-right">
					<ul class="unstyled hidden-phone">
						{% if bodyClass == 'multimedia' %}
							<li><a href="http://www.facebook.com/pages/The-Daily-Gamecock/86427810799"><img src="{{ 'assets/dist/images/facebook_l.png'|asset}}"/></a></li>
							<li><a href="http://twitter.com/thegamecock"><img src="{{ 'assets/dist/images/twitter_l.png'|asset}}"/></a></li>
							<li><a href="http://www.youtube.com/user/thedailygamecock"><img src="{{ 'assets/dist/images/youtube_l.png'|asset}}"/></a></li>
							<li><a href="{{ 'dart/feed/top-stories.xml'|url }}"><img src="{{ 'assets/dist/images/rss_l.png'|asset}}"/></a></li>
						{% else %}
							<li><a href="http://www.facebook.com/pages/The-Daily-Gamecock/86427810799"><img src="{{ 'assets/dist/images/facebook.png'|asset}}"/></a></li>
							<li><a href="http://twitter.com/thegamecock"><img src="{{ 'assets/dist/images/twitter.png'|asset}}"/></a></li>
							<li><a href="http://www.youtube.com/user/thedailygamecock"><img src="{{ 'assets/dist/images/youtube.png'|asset}}"/></a></li>
							<li><a href="{{ 'dart/feed/top-stories.xml'|url }}"><img src="{{ 'assets/dist/images/rss.png'|asset}}"/></a></li>
						{% endif %}
					</ul>
				</div><!-- /.span6 -->
			</div><!-- /.row .hidden-phone #top-ticker -->
			<div class="row" id="masthead">
				<div class="span2">
					<div class="hidden-phone hidden-tablet" id="weather" >
						<span>{{ weather }}</span>
						<p{% if active == "multimedia" %} style="color:#7f7f7f;"{% endif %}><strong{% if active == "multimedia" %} style="color:#7f7f7f;"{% endif %}>{{ weather.temp }}&deg;F&nbsp;</strong>/&nbsp;{{ weather.tempC}}&deg;C</p>
						<a href="{{ weather.url }}" target = "_blank">7 day forecast</a>
					</div><!-- /.hidden-phone #weather -->
				</div>

				<div class="span8 text-center">
					<a href="{{ '/'|url }}"><img src="{% if bodyClass == 'multimedia' %}{{ 'assets/dist/images/DGlogo-reverse.png'|asset}}{% else %}{{ 'assets/dist/images/DGlogo.png'|asset}}{% endif %}"/></a>
					<h3 class="text-center">{{ now|date('l, F j, Y')}}</h3>
				</div><!-- /.span6 .text-center -->
			</div><!-- /.row #masthead -->

			<hr class="spacer" />

		</header>

		<div class="navbar">
			<div class="navbar-inner">
				<a class="brand hidden-desktop" href="#" data-toggle="collapse" data-target=".nav-collapse">Navigation</a>
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-chevron-down"></span>
				</a>
				<div class="nav-collapse collapse">
					<ul class="nav">

						<li{% if not active or active == "home" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'top_stories']) }}"><a href="{{ '/'|url }}">Home</a></li>

						<li{% if active == "news" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'news']) }}"><a href="{{ 'section/news'|url }}">News</a></li>

						<li{% if active == "viewpoints" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'viewpoints']) }}"><a href="{{ 'section/viewpoints'|url }}">Viewpoints</a></li>

						<li{% if active == "mix" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'mix']) }}"><a href="{{ 'section/mix'|url }}">The Mix</a></li>

						<li{% if active == "sports" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'sports']) }}"><a href="{{ 'section/sports'|url }}">Sports</a></li>

						<li{% if active == "multimedia" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'multimedia']) }}"><a href="{{ 'multimedia'|url }}">Multimedia</a></li>

						<li{% if active == "blog" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'blog']) }}"><a href="{{ 'blog'|url }}">Blogs</a></li>
					</ul>
					<div class="span3">
					<div class="pull-right">
						<form id="search" method="get" action="{{ 'search'|url }}">
							<input id="searchField" type="text" name="q" placeholder="Search" class="span2" />
						</form>
					</div><!-- /.pull-right -->
				</div><!-- /.span3 -->
				</div>
			</div><!-- /.navbar-inner -->
		</div><!-- /.navbar -->

		<hr class="double spacer clearfix" />

		<div class="container" id="main-content">
		    {# THIS IS THE MAIN CONTENT BLOCK #}
		    {% block content %}{% endblock %}
		    <hr class="double spacer clearfix" />
	    </div>

		<hr class="half spacer" />

		<!-- 							<li><a href="{{ 'section/sports'|url }}">Sports</a></li>
										<li><a href="{{ 'multimedia'|url }}">Multimedia</a></li>
										<li><a href="{{ 'blog'|url }}">Blogs</a></li> -->

		<footer>
			<hr class="double spacer clearfix" />
			<hr class="spacer clearfix" />
			<div class="row">
				<div class="span8">
					<div class="row-fluid">
						<div class="span12">
						<div class="span3">
							<ul>
								<li><span><a href = "{{ 'section/news'|url }}">News</a></span>
									<ul>
										<li><a href = "{{ 'section/campus'|url }}">Campus</a></li>
										<li><a href = "{{ 'section/columbia'|url }}">Columbia</a></li>
										<li><a href = "{{ 'section/in-brief'|url }}">In Brief</a></li>
									</ul>
								</li>
							</ul>
							</div>
							<div class="span3">
							<ul>
								<li><span><a href = "{{ 'section/viewpoints'|url }}">Viewpoints</a></span>
									<ul>
										<li><a href = "{{ 'section/column'|url }}">Columns</a></li>
										<li><a href = "{{ 'section/in-our-opinion'|url }}">In Our Opinion</a></li>
										<li><a href = "{{ 'section/letter-to-the-editor'|url }}">Letter to the Editor</a></li>
									</ul>
								</li>
							</ul>
							</div>
							<div class="span3">
							<ul>
								<li><span><a href = "{{ 'section/mix'|url }}">The Mix</a></span>
									<ul>
										<li><a href = "{{ 'section/feature'|url }}">Features</a></li>
										<li><a href = "{{ 'section/food'|url }}">Food</a></li>
										<li><a href = "{{ 'section/movies'|url }}">Movies/TV</a></li>
										<li><a href = "{{ 'section/music'|url }}">Music</a></li>
										<li><a href = "{{ 'section/theater'|url }}">Theater</a></li>
									</ul>
								</li>
							</ul>
							</div>
							<div class="span3">
							<ul>
								<li><span><a href = "">Special Sections</a></span>
									<ul>
										<li><a href="{{ 'page/parents-weekend'|url }}">Parents Weekend</a></li>
										<li><a href="{{ 'page/discover-carolina'|url }}">Discover Carolina</a></li>
										<li><a href="{{ 'page/football-tab'|url }}">Football Tab</a></li>
									</ul>
								</li>
							</ul>
							</div>
						</div><!-- /.span12 -->
					</div><!-- /.row-fluid -->
					<hr class="double spacer" />
					<div class="row-fluid">
						<div class="span12">
							<div class="span3">
							<ul>
								<li><span><a href = "{{ 'section/sports'|url }}">Sports</a></span>
									<ul>
										<li><a href = "{{ 'section/football'|url }}">Football</a></li>
										<li><a href = "{{ 'section/basketball'|url }}">Basketball</a></li>
										<li><a href = "{{ 'section/baseball'|url }}">Baseball</a></li>
									</ul>
								</li>
							</ul>
							</div>
							<div class="span3">
							<ul>
								<li><span><a href = "{{ 'blog'|url }}">Blogs</a></span>
									<ul>
										{% fetch blogs from blog with [
											'order': 'name asc',
											'where': 'status = 1'
										]%}
										{% for blog in blogs %}
											<li><a href = "{{ blog.url }}">{{ blog.name }}</a></li>
										{% endfor %}
									</ul>
								</li>
							</ul>
							</div>
							<div class="span3">
							<ul>
								<li><span><a href = "{{ 'multimedia'|url }}">Multimedia</a></span>
									<ul>
										<li><a href = "{{ 'multimedia/video'|url }}">Video</a></li>
										<li><a href = "{{ 'gallery'|url }}">Galleries</a></li>
										<li><a href = "{{ 'multimedia/audio'|url }}">Audio</a></li>
									</ul>
								</li>
							</ul>
							</div>
						</div><!-- /.span12 -->
					</div><!-- /.row-fluid -->

				</div><!-- /.span8 -->

				<div class="span4">
					<div class="row-fluid">
						<div class="span6">
							<ul>
								<li><span><a href="{{ 'page/about'|url }}">About</a></span>
									<ul>
										<li><a href="{{ 'page/about'|url }}">Staff</a></li>
										<li><a href="https://sites.google.com/site/jointdg/">Join Our Staff</a></li>
										<li><a href="{{ 'page/contact'|url }}">Contact</a></li>
										<li><a href="{{ 'page/find-a-paper'|url }}">Find a Paper</a></li>
									</ul>
								</li>
								<hr class="spacer" />
								<li><span><a href="{{ 'page/advertising'|url }}">Advertising</a></span>
									<ul>
										<li><a href="{{ 'classified'|url }}">Classifieds</a></li>
									</ul>
								</li>
								<hr class="spacer" />
								<li><span><a href = "{{ 'page/find-a-paper'|url }}">Find a Paper</a></span></li>
								<hr class="spacer" />
								<li><span><a href = "{{ 'page/app'|url }}">App</a></span></li>
							</ul>
						</div><!-- /.span6 -->
						<div class="span6 no-border text-center">
							<strong>Print Edition</strong><br />

							<a href="{{ issuuDoc.recent.link }}" target="_blank"><img src="{{ issuuDoc.recent.thumb_large }}" alt="front page" class="issuu-preview" /></a>
							<a href="http://issuu.com/thedailygamecock" target="_blank">More Print Editions</a>

							<hr class="spacer hidden-desktop" />
						</div><!-- /.span6 -->
					</div><!-- /.row-fluid -->
				</div><!-- /.span4 -->
			</div><!-- /.row -->
			<div class="row">
				<div class="span12 text-center">
					<a href="{{ '/'|url }}"><img src="{{ 'assets/dist/images/gamecock.png'|asset }}" class="logo" /></a>

					<h6>&copy; 2013 The Daily Gamecock</h6>

					<div id="snworks-bug">
						Powered by <a href="http://getsnworks.com" target="_blank"><img src="http://cdn.thesn.net/gAssets/SNworks_gray.png" alt="powered by SNworks" title="powered by SNworks" /></a> Solutions by The State News
					</div><!-- /#snworks-bug -->
				</div><!-- /.span12 .text-center -->
			</div><!-- /.row -->
		</footer>
		<hr class="spacer clearfix"/>
</div>

    <script type="text/javascript">

      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-17827264-1']);
      _gaq.push(['_setDomainName', 'none']);
      _gaq.push(['_setAllowLinker', true]);
      _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();

    </script>

{{ disqus.includejs() }}
</body>

</html>
