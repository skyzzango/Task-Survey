package task;

public class TaskDao {
	private static TaskDao instance = null;

	private TaskDao() { }

	private static class LazyHolder {
		static final TaskDao INSTANCE = new TaskDao();
	}

	public static TaskDao getInstance() {
		return LazyHolder.INSTANCE;
	}

	public static TaskDao getInstance1() {
		if (instance == null) {
			synchronized (TaskDao.class) {
				if (instance == null) {
					instance = new TaskDao();
				}
			}
		}
		return instance;
	}

}
