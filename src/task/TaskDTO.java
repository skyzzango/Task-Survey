package task;

public class TaskDTO {
	private String head = "";
	private String desc = "";
	private String description = "";

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "TaskDTO{" +
				"head='" + head + '\'' +
				", desc='" + desc + '\'' +
				", description='" + description + '\'' +
				'}';
	}
}
