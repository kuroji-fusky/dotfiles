/**
 * A function that constructs an element
 * @author Kuroji Fusky
 */
function __CREATE(tag, options) {
  const { className, id, inlineStyles, ...params } = options;
  const element = document.createElement(tag);

  // ### TYPE VALIDATION ###
  const isStyleTag = tag === "style";

  if (isStyleTag) {
    if (!!className || !!id) {
      throw new Error(
        "<style> tag specified, params className and id are ignored"
      );
    }
  }

  // Append to inline styles if the style tag is identified
  const styleLength = Object.keys(inlineStyles).length;

  function parseStylesToCSS() {
    let selectorArray = [];
    let inlineStylesObject = {};

    for (const [selector, cssStyles] of Object.entries(inlineStyles)) {
      selectorArray.push(`${selector} {`);
      for (const [rule, style] of Object.entries(cssStyles)) {
        const ruleLowercaseSplit = rule
          .split(/(?=[A-Z])/)
          .join("-")
          .toLowerCase();
        selectorArray.push(`\t${ruleLowercaseSplit}: ${style};`);

        inlineStylesObject[rule] = style;
      }
      selectorArray.push("}");
    }

    const parseSelectorArray = selectorArray.join("\n");
    return { parseSelectorArray, inlineStylesObject };
  }

  if (!isStyleTag && styleLength >= 1) {
    console.warn(
      "Detected styleContents, but <style> tag not detected; will be appending as inline styles instead"
    );

    const { inlineStylesObject } = parseStylesToCSS();
    for (const [rule, style] of Object.entries(inlineStylesObject)) {
      element.style[rule] = style;
    }
  }

  return element;
}
