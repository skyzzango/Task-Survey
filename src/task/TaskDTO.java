package task;

import java.util.List;

public class TaskDto {
	private String title;
	private String seq;
	private String description;
	private List<String> associated;

	public TaskDto(String title, String seq, String description, List<String> associated) {
		this.title = title;
		this.seq = seq;
		this.description = description;
		this.associated = associated;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<String> getAssociated() {
		return associated;
	}

	public void setAssociated(List<String> associated) {
		this.associated = associated;
	}

	@Override
	public String toString() {
		return "TaskDto{\n" +
				"title='" + title + '\'' +
				",\n seq='" + seq + '\'' +
				",\n description='" + description + '\'' +
				",\n associated=" + associated +
				"\n}";
	}
}
