package rally.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jca.dao.DatabaseDao;
import rally.helpers.ContextUtils;
import rally.models.rank.FinalRanking;

public class FinalRankServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        ServletContext context = request.getServletContext();
        DatabaseDao dao = ContextUtils.getContextDao(context);
        Gson gson = ContextUtils.getGsonFromContext(context);
        List<Object> finalRankingList;
        try {
            finalRankingList = dao.findAll(new FinalRanking());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        response.setContentType("application/JSON");
        out.println(gson.toJson(finalRankingList));
    }
}
