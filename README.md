# Blocmetrics
### Use Blocmetrics to track site views.
Go to Blocmetrics and sign up for an account.
Add a site and take not of the site id number.
Add the javascript snippet below to the site you want to track, such as the layout/application view in rails.  Make sure to add it directly before the `</body>` tag. Insert you site id in the given space in the quotes.
```javascript
var _bm_event = {
  name: "visit",
  site_id: "INSERT ID HERE",
}

var _bm_request = new XMLHttpRequest();
_bm_request.open("POST", "http://localhost:3000/api/events.json", true);
_bm_request.setRequestHeader('Content-type', 'application/json');
_bm_request.onreadystatechange = function() {};
_bm_request.send(JSON.stringify(_bm_event));
```
Then any time someone visits your site it will show up in a nifty graph on Blocmetrics.
Note: Blocmetrics is not currently in production.  TO try it out it must be cloned to a local machine.