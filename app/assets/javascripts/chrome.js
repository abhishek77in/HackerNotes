var toolbarConfig = {
  hide: 'noIndyExtToolbar',
  title: 'HackerNotes',
  slide: true,
  link: 'https://chrome.google.com/webstore/detail/hackernotes-plugin/acphikopigkpfbkonnacihkhcefdeagg'
};

if((navigator.userAgent.toLowerCase().indexOf('chrome') > -1) && (localStorage[toolbarConfig.hide] == undefined)) {
  document.write('<div id="ext_toolbar"></div>');

  showToolbar();
}

function showToolbar() {
  $('#ext_toolbar').css({backgroundImage: "url('assets/gradient.png')", fontFamily: 'Tahoma, sans-serif', fontSize: '14px', color: '#333', borderBottom: '1px solid #CCC', height: "37px", zIndex: 1000});
  $('#ext_toolbar').append("<div id=\"ext_toolbar_close\"><span style=\"display:none;\">Close</span></div>");
  $('#ext_toolbar').append("<div id=\"ext_toolbar_install\"><span style=\"display:none;\">Install</span></div>");
  $('#ext_toolbar').append("<div id=\"ext_toolbar_text\">"+toolbarConfig.title+" has a <span id=\"ext_toolbar_link\">Google Chrome Extension</span>. It makes coming from Github to Hacker Notes super easy.</div>");
  $('#ext_toolbar_link').css({textDecoration:"underline", color: "#4B689C", cursor:"pointer"});
  $('#ext_toolbar_text').css({padding: "6px 10px 10px 38px", background: "url('assets/ext-icon.png') no-repeat 5px 5px", overflow:"hidden", whiteSpace:"nowrap", "-webkit-user-select":"none", cursor: "default"});
  $('#ext_toolbar_close').css({float:"right", background: "url('assets/close.png') no-repeat", width:"10px", height:"10px", margin: "14px 10px 0 0", cursor:"pointer"});
  $('#ext_toolbar_install').css({float:"right", background: "url('assets/install.png') no-repeat", width:"87px", height:"26px", margin: "6px 10px 0 0", cursor:"pointer"});

  if(toolbarConfig.slide) {
    $('#ext_toolbar').hide().slideDown('fast');
  }
  $('#ext_toolbar_close').click(closeToolbar);
  $('#ext_toolbar_install').click(openExtension); // currently set to open directory not direct download
  $('#ext_toolbar_link').click(openExtension); // currently set to open directory not direct download

  $("embed").attr("wmode", "opaque");
  $(window).resize(flow);
  $(window).scroll(move);
  move();
}

function closeToolbar() {
  $('#ext_toolbar').slideUp('fast');
  localStorage[toolbarConfig.hide] = true;
}

function openExtension() {
  closeToolbar();
  window.open(toolbarConfig.link);
}

function flow() {
  $('#ext_toolbar_text').width($(window).width() - 170);
  $("#ext_toolbar").css({width:$(window).width()});
}

function move() {
  if($(window).scrollTop() <= 1) {
    $("#ext_toolbar").css({position:"relative", top: 0});
  }
  else {
    $("#ext_toolbar").css({position:"absolute", top: $(window).scrollTop()+"px", width: $(window).width(), zIndex:"10000"});
  }
  flow();
}

function loadScript(url, callback){
  // include remote list
  var script = document.createElement("script")
  script.type = "text/javascript";
  script.onload = function(){
    loaded = true;
    callback();
  };
  script.src = url;
  document.getElementsByTagName("head")[0].appendChild(script);
}
