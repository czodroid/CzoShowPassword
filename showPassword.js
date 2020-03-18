// Filename: showPassword.js
// Author_: a1618@love.com
// Modified By: Olivier Sirol <czo@free.fr>
// License: GPL-2.0
// File Created: mars 2020
// Last Modified: mercredi 18 mars 2020, 14:34
// Edit Time: 1:17:38
// Description:
//      Extension for chromium and firefox
//      Show password when double-clicking over password fields. 
//      Same as https://chrome.google.com/webstore/detail/showpassword/bbiclfnbhommljbjcoelobnnnibemabl
//      but only whith double-click.
//      I made a clone because when there is a non-personal automatic update, I don’t want my passwords stolen.
//
// $Id:$

(function (win) {
    'use strict';
    var KEY_ENTER = 13;
    var KEY_CTRL = 17;

    function mouseDblClick(tar) {
        tar.addEventListener('dblclick', function () {
            if (tar.type === 'password') {
                tar.type = 'text';
            } else {
                tar.type = 'password';
            }
        }, false);

        tar.addEventListener('blur', function () {
            tar.type = 'password';
        }, false);

        tar.addEventListener('keydown', function (e) {
            if (e.keyCode === KEY_ENTER)
                tar.type = 'password';
        }, false);
    }

    var doc = win.document;
    var MutationObserver = win.MutationObserver || win.WebKitMutationObserver;

    function modifyInputs() {
        var passwordInputs = doc.querySelectorAll('input[type=password]');
        for (var j = 0; j < passwordInputs.length; j++) {
            var passwordInput = passwordInputs[j];

            if (!passwordInput.ready) {
                mouseDblClick(passwordInput);
                passwordInput.ready = true; //mark as modified
            }
        }
    }

    modifyInputs();

    var observer = new MutationObserver(modifyInputs);

    observer.observe(doc.documentElement, {
        childList: true,
        subtree: true
    });

})(this);



