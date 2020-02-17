package com.mmm.web.movie;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mmm.common.Page;
import com.mmm.common.Search;
import com.mmm.service.domain.Movie;
import com.mmm.service.domain.User;
import com.mmm.service.domain.WishStarRating;
import com.mmm.service.movie.MovieService;

@RestController
@RequestMapping("/movie/*")
public class MovieRestController {
	
	///Field
	
		@Autowired
		@Qualifier("movieServiceImpl")
		private MovieService movieService; //DI 받자
		
		@Value("#{commonProperties['pageSize']}")
		int pageSize;
		
		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;

		//Constructor
		public MovieRestController() {
			System.out.println(this.getClass()+"   Constructor Call...");
		}
		
		
//		보고싶어요 활성화 
		@RequestMapping(value = "json/addWish", method = RequestMethod.POST )
		public Map<String, Object> addWish(@RequestBody WishStarRating wishStarRating) throws Exception {
			System.out.println("--- --- /movie/addWish : POST");
			System.out.println("wishStarRating    "+wishStarRating);
			
//			BL 수행
			movieService.addWish(wishStarRating);
			
//			getMovie() 준비
			Movie inputMovie = new Movie();
			inputMovie.setMovieNo(wishStarRating.getMovieNo());
			inputMovie.setUserNo(wishStarRating.getUserNo());
			System.out.println("--------------------------inputMovie"+inputMovie);
			
//			 getMovie() 수행
			Movie movie = movieService.getMovieByMovieNo(inputMovie);
			System.out.println("------------------------- movie"  + movie);
			
//			JSON이기 때문에 Map에 담아서 return
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("movie", movie);
			return resultMap;
		}
		
//		보고싶어요 삭제
		@RequestMapping(value = "json/deleteWish", method = RequestMethod.POST)
		public Map<String, Object> deleteWish(@RequestBody WishStarRating wishStarRating) throws Exception{
			System.out.println("--- --- /movie/deleteWish : POST");
			
			movieService.deleteWish(wishStarRating);
			
			Movie inputMovie = new Movie();
			inputMovie.setMovieNo(wishStarRating.getMovieNo());
			inputMovie.setUserNo(wishStarRating.getUserNo());
//			System.out.println("--------------------------inputMovie"+inputMovie);
			
			Movie movie = movieService.getMovieByMovieNo(inputMovie);
			System.out.println("------------------------- movie"  + movie);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("movie", movie);
			return resultMap;
		}
		
//		평점 등록
		@RequestMapping(value = "json/addStarRating", method = RequestMethod.POST)
		public Map<String, Object> addStarRating(@RequestBody WishStarRating wishStarRating)throws Exception{
			System.out.println("--- --- /movie/addStarRating : POST");

			movieService.addStarRating(wishStarRating);
			
			Movie inputMovie = new Movie();
			inputMovie.setMovieNo(wishStarRating.getMovieNo());
			inputMovie.setUserNo(wishStarRating.getUserNo());
//			System.out.println("--------------------------inputMovie"+inputMovie);
			
			Movie movie = movieService.getMovieByMovieNo(inputMovie);
			System.out.println("------------------------- movie"  + movie);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("movie", movie);
			return resultMap;
		}
		
//		평점 수정, 삭제 ( 0 일 경우 삭제... in Dao)
		@RequestMapping(value = "json/updateStarRating", method = RequestMethod.POST)
		public Map<String, Object> updateStarRating(@RequestBody WishStarRating wishStarRating)throws Exception{
			System.out.println("--- --- /movie/updateStarRating : POST");
			
			movieService.updateStarRating(wishStarRating);
			
			Movie inputMovie = new Movie();
			inputMovie.setMovieNo(wishStarRating.getMovieNo());
			inputMovie.setUserNo(wishStarRating.getUserNo());
			
			Movie movie = movieService.getMovieByMovieNo(inputMovie);
			System.out.println("------------------------- movie"  + movie);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("movie", movie);
			return resultMap;
		}
		
		
//		안쓰게 되었다...
		@RequestMapping(value = "json/getBoxOfficeList", method = RequestMethod.POST)
		public Map<String, Object> getBoxOfficeList( @RequestBody Search search,
														HttpSession session)throws Exception{
			
//			1. Business Logic Layer의 getBoxOfficeList()의 Parameter 'search' 세팅 작업///////////////////////////// 
//			만일 Get방식으로 처음 접근해서 currentPage가 없는 경우.. currentPage Default 설정
			if(search.getCurrentPage() ==0 ) {
				search.setCurrentPage(1);
			}
			
//			개봉한 영화 플래그
			search.setOnBoxOfficeFlag(1);
			
			System.out.println("  sessionUser ::" +session.getAttribute("user"));
			
			
//			@Value로 갖고 있는 field pageSize 세팅
			search.setPageSize(pageSize);
			System.out.println("------------search"+ search);
			
//			2. Business Logic 수행 ///////////////////////////////////////////////////
//			List<Object> list, int totlaCnt IN MAP 
			HashMap<String, Object> outputMap = movieService.getBoxOfficeList(search);
			
//			3. return Page로 보낼 model 들 작업 //////////////////////////////////////////
//			페이지 관련  만들어주기
			Page resultPage = new Page(search.getCurrentPage(), ((Integer)outputMap.get("totalCnt")).intValue(),
					pageUnit, pageSize);
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("list", outputMap.get("list"));
			returnMap.put("search", search);
			returnMap.put("resultPage", resultPage);
			
			return returnMap;			
		}
		
		@RequestMapping(value = "json/getExpectedMovieList", method = RequestMethod.POST)
		public Map<String, Object> getExpectedMovieList( @RequestBody Search search,
														HttpSession session)throws Exception{
			
//			1. Business Logic Layer의 getBoxOfficeList()의 Parameter 'search' 세팅 작업///////////////////////////// 
//			만일 Get방식으로 처음 접근해서 currentPage가 없는 경우.. currentPage Default 설정
			if(search.getCurrentPage() ==0 ) {
				search.setCurrentPage(1);
			}
			
//			상영예정작 영화 플래그
			search.setOnBoxOfficeFlag(0);
			
			System.out.println("  sessionUser ::" +session.getAttribute("user"));
			
			
//			@Value로 갖고 있는 field pageSize 세팅
			search.setPageSize(pageSize);
			System.out.println("------------search"+ search);
			
//			2. Business Logic 수행 ///////////////////////////////////////////////////
//			List<Object> list, int totlaCnt IN MAP 
			HashMap<String, Object> outputMap = movieService.getBoxOfficeList(search);
			
//			3. return Page로 보낼 model 들 작업 //////////////////////////////////////////
//			페이지 관련  만들어주기
			Page resultPage = new Page(search.getCurrentPage(), ((Integer)outputMap.get("totalCnt")).intValue(),
					pageUnit, pageSize);
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("list", outputMap.get("list"));
			returnMap.put("search", search);
			returnMap.put("resultPage", resultPage);
			
			return returnMap;			
		}
		
		@RequestMapping(value="json/getSummary/{movieNo}", method = RequestMethod.GET)
		public Map<String, Object> getSummary(@PathVariable("movieNo") int movieNo)throws Exception{
			
			Movie inputMovie = new Movie();
			inputMovie.setMovieNo(movieNo);
			Movie outputMovie = movieService.getMovieByMovieNo(inputMovie);
			
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("movie", outputMovie);
			
			return returnMap;	
		}
}
