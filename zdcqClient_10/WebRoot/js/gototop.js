//<![CDATA[
var goto_top_type = -1;
var goto_top_itv = 0;
function goto_top_timer() {
	var y = goto_top_type == 1 ? document.documentElement.scrollTop : document.body.scrollTop;
	var moveby = 15;
	y -= Math.ceil(y * moveby / 100);
	if (y < 0) {
		y = 0;
	}
	if (goto_top_type == 1) {
		document.documentElement.scrollTop = y;
	} else {
		document.body.scrollTop = y;
	}
	if (y == 0) {
		clearInterval(goto_top_itv);
		goto_top_itv = 0;
	}
}
function goto_top() {
	if (goto_top_itv == 0) {
		if (document.documentElement && document.documentElement.scrollTop) {
			goto_top_type = 1;
		} else {
			if (document.body && document.body.scrollTop) {
				goto_top_type = 2;
			} else {
				goto_top_type = 0;
			}
		}
		if (goto_top_type > 0) {
			goto_top_itv = setInterval("goto_top_timer()", 1);
		}
	}
}


function goto_top_timer2() {
	var y = goto_top_type == 1 ? parent.document.documentElement.scrollTop : parent.document.body.scrollTop;
	var moveby = 15;
	y -= Math.ceil(y * moveby / 100);
	if (y < 0) {
		y = 0;
	}
	if (goto_top_type == 1) {
		parent.document.documentElement.scrollTop = y;
	} else {
		parent.document.body.scrollTop = y;
	}
	if (y == 0) {
		clearInterval(goto_top_itv);
		goto_top_itv = 0;
	}
}
function goto_top2() {
	if (goto_top_itv == 0) {
		if (parent.document.documentElement && parent.document.documentElement.scrollTop) {
			goto_top_type = 1;
		} else {
			if (parent.document.body && parent.document.body.scrollTop) {
				goto_top_type = 2;
			} else {
				goto_top_type = 0;
			}
		}
		if (goto_top_type > 0) {
			goto_top_itv = setInterval("goto_top_timer2()", 1);
		}
	}
}


//]]>

