package com.mawujun.chapter7;

import java.io.Serializable;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.ExecutionListener;

/**
 * 流程结束监听器
 *
 * @author henryyan
 */
public class ProcessEndExecutionListener implements ExecutionListener, Serializable {

    private static final long serialVersionUID = 1L;

    @Override
    public void notify(DelegateExecution execution) {
        execution.setVariable("setInEndListener", true);
        System.out.println(this.getClass().getSimpleName() + ", " + execution.getEventName());
    }

}
