package com.ccz.aspect;

import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ccz.po.Log;
import com.ccz.service.LogService;
/**
 * 切面类，在此类中编写通知
 */
@Aspect
@Component
public class MyAspect {
	@Autowired
	private LogService logService;
	// 定义切入点表达式
	@Pointcut("execution(* com.ccz.web.controller.*.*(..))")
	// 使用一个返回值为void、方法体为空的方法来命名切入点
	private void myPointCut(){}
	// 环绕通知	
	@Around("myPointCut()")
	public Object myAround(ProceedingJoinPoint proceedingJoinPoint) 
            throws Throwable {
		// 开始
		logService.createLog(new Log(new Date(),"用户尝试"+ proceedingJoinPoint.getSignature().getName()+"操作"));
		// 执行当前目标方法
		Object obj = proceedingJoinPoint.proceed();
		// 结束
		logService.createLog(new Log(new Date(),"操作"+ proceedingJoinPoint.getSignature().getName()+"成功。"));
		return obj;
	}
	// 异常通知
	@AfterThrowing(value="myPointCut()",throwing="e")
	public void myAfterThrowing(JoinPoint joinPoint, Throwable e) {
		System.out.println("异常通知：" + e.getMessage());
	}
}
