package test;

import org.junit.Test;

import daoimpl.UpFirst;
import daoimpl.dbDeal;

public class test {
	@Test
	public void testcusNum() {
		int data[]=new int[7];
		dbDeal up=new dbDeal();
		data=up.cusNum();
		for(int i:data){
			System.out.println(i);
		}
	}
	@Test
	public void testvisCycle(){
		int data[]=new int[6];
		dbDeal up=new dbDeal();
		data=up.visCycle();
		for(int i:data){
			System.out.println(i);
		}
	}
	@Test
	public void testUptimex(){
		UpFirst up=new UpFirst();
		up.Uptimex();
	}
	
	@Test
	public void testUptimeAnum(){
		UpFirst up=new UpFirst();
		up.UptimeAnum();
	}
	@Test
	public void testinsFirst(){
		UpFirst up=new UpFirst();
		up.insFirst();
	}
	
}
