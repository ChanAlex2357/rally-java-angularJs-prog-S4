package rally.helpers;

import jca.dao.DatabaseDao;
import jca.dao.conn.ConnConfig;
import jca.dao.conn.PostgresqlConnConfing;

public class RallyDao {
    static private DatabaseDao rallyDao;
    static DatabaseDao getDao(){
        if (rallyDao == null) {
            ConnConfig config = new PostgresqlConnConfing(
                PostgresqlConnConfing.LOCALHOST,
                "rally", "chan_alex","jca"
            );
            rallyDao = new DatabaseDao(config);
        }
        return RallyDao.rallyDao;
    }
}
