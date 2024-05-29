package rally.helpers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletContext;
import jca.dao.DatabaseDao;

import java.time.LocalTime;

public class ContextUtils {
    public static DatabaseDao getContextDao(ServletContext context) {
        DatabaseDao dao = (DatabaseDao) context.getAttribute("dao");
        if (dao == null) {
            dao = RallyDao.getDao();
            context.setAttribute("dao", dao);
        }
        return dao;
    }

    public static Gson getGsonFromContext(ServletContext context) {
        Gson gson = (Gson) context.getAttribute("gson");
        if(gson == null) {
            GsonBuilder gsonBuilder = new GsonBuilder();
            gsonBuilder.registerTypeAdapter(LocalTime.class, new LocalTimeTypeAdapter());
            gson = gsonBuilder.create();
            context.setAttribute("gson", gson);
        }
        return gson;
    }
}
