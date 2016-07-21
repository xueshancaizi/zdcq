package com.zdcq.s2sh.exception;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ErrorPrcessor extends ActionSupport{
	private Exception exception;

	public Exception getException() {
		return exception;
	}

	public void setException(Exception exception) {
		this.exception = exception;
	}
	
	@Override
	public String execute(){
		ActionContext.getContext().getValueStack().push(this.exception.getMessage());
		return SUCCESS;
	}
}
