// ==UserScript==
// @name         Fix SoundCloud Font Weight
// @description  Fixes SoundCloud font-weights for Firefox
// @author       Kuroji Fusky
// @match        soundcloud.com/*
// @grant        none
// ==/UserScript==
(function () {
  "use strict";

  let inlineStyle = `
    .sc-classic .g-type-shrinkwrap-large-primary,
    .sc-classic .g-type-shrinkwrap-primary {
      font-weight: 700 !important;
    }
    .sc-classic .soundTitle.listenContext .soundTitle__title,
    .sc-classic .soundTitle.listenContext .soundTitle__title.g-type-shrinkwrap-inline:hover,
    .sc-classic .mixedSelectionModule__titleText {
      font-weight: 600 !important;
    }
    .sc-classic .g-type-shrinkwrap-large-secondary,
    .sc-classic .g-type-shrinkwrap-large-secondary:visited,
    .sc-classic .g-type-shrinkwrap-secondary,
    .sc-classic .g-type-shrinkwrap-secondary:visited,
    .sc-classic .listenInfo__releaseData {
      font-weight: 500 !important;
    }
    .sc-button,
    .sc-type-light,
    .sc-font-light,
    .sc-classic .genericTrackCount__subtitle,
    .sc-classic .soundTitle__title,
    .sc-classic .soundTitle__uploadTime,
    .sc-classic .listenInfo__releaseData,
    .sc-classic .sidebarHeader__more,
    .sc-classic .header,
    .sc-classic .g-form-section-title,
    .sc-tag,
    .sc-tag:visited,
    .sc-type-medium,
    .sc-type-small,
    .sc-ministats,
    .sc-buylink-medium {
      font-weight: 400 !important;
    }
    .listenInfo__releaseTitle.sc-text-secondary.sc-text-h4,
    .sc-input,
    .sc-button-small.sc-button-dropdown {
      font-weight: 300 !important;
    }
  `;

  let styleElement = document.createElement("style");
  styleElement.id = "sc-font-fix";
  styleElement.appendChild(document.createTextNode(inlineStyle));

  document.head.appendChild(styleElement);
})();
