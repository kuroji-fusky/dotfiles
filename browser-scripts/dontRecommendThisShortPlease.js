// ==UserScript==
// @name         Don't Recommend This Short
// @description  A simple script that a single press of a button that will never recommend a brain-dead short ever again!
// @author       Kuroji Fusky
// @match        https://www.youtube.com/shorts/*
// @grant        none
// ==/UserScript==
(window.onkeydown = (e) => {
	// TODO: Disable action if the URL isn't under 'youtube.com/shorts'
	if(e.key=='n') $$('ytd-menu-service-item-renderer')[1].click()
})()
