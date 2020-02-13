package com.mmm.service.theater.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mmm.common.Search;
import com.mmm.service.datetime.DateTimeService;
import com.mmm.service.domain.Theater;
import com.mmm.service.theater.TheaterService;
import com.mmm.service.ticketing.TicketingService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-aspect.xml",
									"classpath:config/context-common.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class TheaterServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	private DateTimeService dateTimeService;

	@Autowired
	private TheaterService theaterService;
	
	@Autowired
	private TicketingService ticketingService;	
	
	private Theater theater;
	
	//@Test
	public void testAddTheater() throws Exception {
		
		
		theater = new Theater();
		
		theater.setMovieName("기생충");
		theater.setFranchise("CGV");
		theater.setTheaterName("CGV강남");
		theater.setScreenName("1관");
		
		//theaterService.addTheater(theater);
		
		theater = theaterService.getTheater("10001");
		Assert.assertEquals("기생충", theater.getMovieName());
		Assert.assertEquals("CGV", theater.getFranchise());
		Assert.assertEquals("CGV강남", theater.getTheaterName());
		Assert.assertEquals("1관", theater.getScreenName());
		Assert.assertEquals(130, theater.getTotalSeat());
		 

	}	
	
	//@Test
	public void testGetTheater() throws Exception {
		

		
		
		Assert.assertNotNull(theaterService.getTheater("10000"));

		
	}
	
	//@Test
	 public void testUpdateTheater() throws Exception{
		
		
		theater = theaterService.getTheater("10000");
		Assert.assertNotNull(theater);

		
		theater.setMovieName("바바리안");
		theater.setFranchise("여기요");
		theater.setScreenName("메가박스 A");
		theater.setTheaterName("매찬123");

		theaterService.updateTheater(theater);
		
		
		theater = theaterService.getTheater("10000");
		Assert.assertNotNull(theater);
			
		//==> API 확인
		Assert.assertEquals("바바리안", theater.getMovieName());
		Assert.assertEquals("메가박스 A", theater.getScreenName());
		Assert.assertEquals("여기요",theater.getFranchise());
		Assert.assertEquals("매찬123", theater.getTheaterName());
		
	 }
	 
	 //@Test
	 public void testDeleteTheater() throws Exception{
		 
		 theaterService.deleteTheater("10000");
	 }
	 
	 
	
	 //==>  주석을 풀고 실행하면....
	 //@Test
	 public void testGetTheaterList() throws Exception{
		 
		 Search search = new Search();
		 search.setSearchCondition("0");
		 search.setMovieName("기생충");
		List<Theater> theater2 =theaterService.getTheaterList(search);
		System.out.println(theater2);
	 }	

}
