
const SESSIONID_COOKIE = 'sessionid';

function flipPanel(id) {
   panel     = document.getElementById(id);
   allPanels = document.getElementsByClassName('panel');
   for (const eachPanel of allPanels)  {
      if (eachPanel != panel) eachPanel.classList.remove('show');
   }
   panel.classList.toggle('show');
}

function makeSessionId() {
     var now = new Date();
     var ranValue = Math.floor(Math.random() * 99999);
     return     now.getFullYear()
        + "-" + twoDigit(now.getMonth()+1)
        + "-" + twoDigit(now.getDate())
        + " " + twoDigit(now.getHours())
        + ":" + twoDigit(now.getMinutes())
        + ":" + twoDigit(now.getSeconds())
        + " " + ("00000" + ranValue).slice(-5);
}

function twoDigit(value) {
    return ("00" + value).slice(-2);
}

function initialize() {
   var sessionid = getMivoterCookie(SESSIONID_COOKIE);

   if (sessionid === '') {
      sessionid = makeSessionId();
      document.cookie = SESSIONID_COOKIE + "=" + sessionid + "; path=/; max-age=" + 60 * 60 * 4; /* 4 hours */
      window.location.href = window.location.href;  /* Looks weird, but forces refresh WITH new cookie for sessionid. */
   }
}

function getMivoterCookie(cookieName) {
    var cookies = document.cookie.split(";");
    for (var i=0;  i < cookies.length;  i++) {
        var cookie = cookies[i].split("=");
        if (cookie[0].trim() === cookieName) return cookie[1];
    }
    return '';
}

