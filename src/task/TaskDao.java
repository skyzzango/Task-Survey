package task;

public class TaskDao {

	private TaskDao() { }

	private static class LazyHolder {
		static final TaskDao INSTANCE = new TaskDao();
	}

	public static TaskDao getInstance() {
		return LazyHolder.INSTANCE;
	}


}
