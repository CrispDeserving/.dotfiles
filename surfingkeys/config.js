// Surfingkeys config by noAbbreviation
settings.richHintsForKeystroke = 200;

settings.hintAlign = "left";
settings.hintExplicit = true;

settings.enableEmojiInsertion = true;
settings.startToShowEmoji = 2;

// familiar vimium keybindings
// from wiki: https://github.com/brookhong/Surfingkeys/wiki
api.map("u", "e");
api.mapkey("p", "Open the clipboard's URL in the current tab", function () {
  Front.getContentFromClipboard(function (response) {
    window.location.href = response.data;
  });
});
api.map("P", "cc");
// api.map('gi', 'i');
api.map("F", "gf");
api.map("gf", "w");
api.map("`", "'");
api.map("=", "t");
api.map("t", "on");
api.map("H", "S");
api.map("L", "D");
// api.map('gt', 'R');
// api.map('gT', 'E');
api.map("K", "R");
api.map("J", "E");

// color scheme
// most is from my alacritty terminal colors
const background = {
  primary: "#f5f3ef",
  accent: "#d0cfcc",
  hints: "#f0c674",
};
const border = {
  color: "#5e5c64",
  colorHints: "#a2734c",
  px: "2",
};
const text = {
  primary: "#171421",
  annotation: "#5e5c64",

  green: "#26a269",
  blue: "#2a7bde",
  purple: "#c061cb",

  size: "12pt",
};

// set theme
// started from: https://github.com/brookhong/Surfingkeys/wiki/Color-Themes#zenbonse
const hintCss = (borderColor) => `
    font-size: calc(0.8 * ${text.size});
    line-height: 80%;
    padding: 0.4ch;
    text-align: center;
    vertical-align: center;
    font-family: OverpassM Nerd Font, Consolas, Menlo, monospace;
    border: 1px solid ${borderColor};
    color: ${text.primary};
    background: initial;
    background-color: ${background.hints};
`;

const normalHintCss = hintCss(border.colorHints);
api.Hints.style(normalHintCss);

const visualHintCss = hintCss(background.primary);
api.Hints.style(visualHintCss, "text");

const visualSelectCss = `
    background-color: #ffa;
    border: 1px solid ${background.accent};
`;
api.Visual.style("marks", visualSelectCss);

settings.theme = `
.sk_theme {
    font-family: Lexend, Input Sans Condensed, Charcoal, sans-serif;
    font-size: ${text.size};
    background: ${background.primary};
    color: ${text.primary};

    tbody {
        color: #fff;
    }

    input {
        color: ${text.primary};
    }

    .url {
        color: ${text.blue};
    }

    .annotation.annotation {
        color: ${text.annotation};
    }

    kbd {
        padding: 0.2ch 0.4ch;
    }

    .omnibar_highlight {
        color: #2a7bde;
    }

    .omnibar_timestamp {
        color: ${text.purple};
    }

    .omnibar_visitcount {
        color: ${text.green};
    }

    #sk_omnibarSearchArea .prompt {
        display: flex;
        gap: 0.5ch;
    }

    /*
     * CSS nesting syntax, pretty recent:
     *
     * - Browser availability: https://caniuse.com/?search=nesting
     * - CSS nesting rules: https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_nesting/Using_CSS_nesting
     */
    #sk_omnibarSearchResult {
        ul li {
            border-radius: 0.8ch;
            padding: 0.75ch;

            &:nth-child(odd) {
                background: ${background.accent};
            }

            &.focused {
                box-shadow: inset -${border.px}px 0 0 ${border.color},
                    inset 0 -${border.px}px 0 ${border.color},
                    inset ${border.px}px 0 0 ${border.color},
                    inset 0 ${border.px}px 0 ${border.color};
                background-color: inherit;

                &:nth-child(odd) {
                    background: ${background.accent};
                }
            }
        }
    }
}

#sk_status {
   font-size: ${text.size};
   padding: 0.4ch 0.8ch;
   padding-bottom: 0.2ch;
   border-bottom: none;
}

#sk_usage * {
    font-size: calc(0.9 * ${text.size});
}

#sk_banner {
    font-family: Lexend, Input Sans Condensed, Charcoal, sans-serif;
    font-size: ${text.size};
    padding: 0.5ch;
    background: initial;
    background-color: ${background.hints};
    border: 1px solid ${border.colorHints};
    border-top: none;
}

#sk_keystroke {
    background: ${background.primary};
    color: ${text.primary};
    border-top-left-radius: 0.8ch;
    box-shadow: inset ${border.px}px 0 0 ${text.annotation},
        inset 0 ${border.px}px 0 ${text.annotation};
}
`;

// click `Save` button to make above settings to take effect.</ctrl-i></ctrl-y>
// or :w to save changes and :q closes this window
