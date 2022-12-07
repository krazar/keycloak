(function() {
  function docReady(callable) {
    // see if DOM is already available
    if (document.readyState === 'complete' || document.readyState === 'interactive') {
        // call on next available tick
        setTimeout(callable, 1)
    } else {
        document.addEventListener('DOMContentLoaded', callable)
    }
  }

  function element(tagName, className, children, innerText) {
    var root = document.createElement(tagName);
    root.className = className;
    root.innerText = innerText || '';
    (children || []).forEach(function (child) {
      root.append(child);
    });
    return root;
  }

   function queryStringParse(str) {
    if (typeof str !== 'string') {
      return {};
    }

    str = str.trim().replace(/^(\?|#)/, '');

    if (!str) {
      return {};
    }

    return str
      .trim()
      .split('&')
      .reduce(function (ret, param) {
        var parts = param.replace(/\+/g, ' ').split('=');
        var key = parts[0];
        var val = parts[1];

        key = decodeURIComponent(key);
        // missing `=` should be `null`:
        // http://w3.org/TR/2012/WD-url-20120524/#collect-url-parameters
        val = val === undefined ? null : decodeURIComponent(val);

        if (!ret.hasOwnProperty(key)) {
          ret[key] = val;
        } else if (Array.isArray(ret[key])) {
          ret[key].push(val);
        } else {
          ret[key] = [ret[key], val];
        }

        return ret;
      }, {});
  }


  var queryParams = queryStringParse(window.location.search);

  if (queryParams.error) {
    if (queryParams.error_uri) {
      window.location.href = queryParams.error_uri;
    }

    if (queryParams.error_description) {
      docReady(function() {
        var wrapper = document.querySelector('#kc-content-wrapper');
        var alert = element('div', 'alert-error pf-c-alert pf-m-inline pf-m-danger', [
          element('div', 'pf-c-alert__icon', [element('span', 'fa fa-fw fa-exclamation-circle')]),
          element('span', 'pf-c-alert__title kc-feedback-text', [], decodeURIComponent(queryParams.error_description)),
        ]);
        wrapper.prepend(alert);
      });
    }
  }
})();
