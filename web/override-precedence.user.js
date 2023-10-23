// ==UserScript==
// @name     Have precendence over articles
// @version  1
// @authro   Kuroji Fusky
// @grant    none
// ==/UserScript==

const hostnames = ["wondershare.com"];

// Use regular for-loop instead of forEach for performance
for (let i = 0; i < hostnames.length; i++) {
  if (location.hostname.includes(hostnames[i])) {
    document.body.setAttribute("style", "overflow-y: visible !important");
  }
}
