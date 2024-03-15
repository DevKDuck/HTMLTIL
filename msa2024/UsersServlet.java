package com.msa2024;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UsersServlet
 */
public class UsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UsersDAO usersDAO = new UsersDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsersServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doService(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doService(request, response);
	}

	// 공통 처리 함수
	private void doService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		switch (action) {
		case "list" -> list(request, response);
		case "view" -> view(request, response);
		case "delete" -> delete(request, response);
		case "updateForm" -> updateForm(request, response);
		case "update" -> update(request, response);
		case "insertForm" -> insertForm(request, response);
		case "insert" -> insert(request, response);

		}
		// 3. jsp 포워딩
		// 포워딩
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/users/" + action + ".jsp");// 여기서의 action이 각
																										// 페이지 이름이잖아!!
		rd.forward(request, response); // 이렇게 하면 제어권이 가고, 위의 줄이 실행될 거라는 것
	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("목록");

		// 1. 처리
		List<Users> list = usersDAO.list();

		// 2. jsp에 출력할 값 설정
		request.setAttribute("list", list);

		// 3. jsp 포워딩은 7번 각각 하기보다, Service에서 한번에!

	}

	private void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("상세보기");
		String userid = request.getParameter("userid");

		// 1. 처리
		Users user = usersDAO.read(userid);

		// 2. jsp에 출력할 값 설정
		request.setAttribute("user", user);

	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("삭제");
		String userid = request.getParameter("userid");

		// 1. 처리
		int updated = usersDAO.delete(userid);

		// 2. jsp에 출력할 값 설정
		request.setAttribute("updated", updated);

	}

	private void updateForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("수정폼화면");
		String userid = request.getParameter("userid");
		// 1. 처리
		Users user = usersDAO.read(userid);

		// 2. jsp에 출력할 값 설정
		request.setAttribute("user", user);

	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("수정화면");
		String userid = request.getParameter("userid");
		String userpassword = request.getParameter("userpassword");
		String username = request.getParameter("username");
		String userage = request.getParameter("userage");
		String useremail = request.getParameter("useremail");

		Users user = new Users(userid, userpassword, username, Integer.parseInt(userage), useremail);

		// 1. 처리
		int updated = usersDAO.update(user);
		// 2. jsp에 출력할 값 설정
		request.setAttribute("updated", updated);

	}
	
	private void insertForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("등록화면");

	}
	
	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("등록 화면");
		String userid = request.getParameter("userid");
		String userpassword = request.getParameter("userpassword");
		String username = request.getParameter("username");
		String userage = request.getParameter("userage");
		String useremail = request.getParameter("useremail");

		Users user = new Users(userid, userpassword, username, Integer.parseInt(userage), useremail);

		// 1. 처리
		int updated = usersDAO.insert(user);
		// 2. jsp에 출력할 값 설정
		request.setAttribute("updated", updated);

	}

}